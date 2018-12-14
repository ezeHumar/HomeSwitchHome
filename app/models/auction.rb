class Auction < ApplicationRecord

  has_one :reservation
  belongs_to :residence
  belongs_to :user, optional: true
  has_many :offers

  #validates :amount, numericality: { greater_than: :amount_was }, if: :persisted?
  validates :residence_id, presence: true
  validate :date_mayor_que_hoy, on: :create
  validates :startDate, presence: true
  #validate :date_mayor_que_hoy, on: :create
  #validate :fecha_no_repetida
  #validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  def max_offer
    offers.order(:amount).last
  end


  private

  def fecha_no_repetida

    if
        errors.add(:startDate, "La fecha ingresada ya esta asignada a una subasta de esta residencia")
    end
  end

  def date_mayor_que_hoy
    if startDate.nil? || startDate < Date.today
      errors.add(:startDate, "Tiene que ser mayor a seis meses desde hoy")
    end
  end
end
