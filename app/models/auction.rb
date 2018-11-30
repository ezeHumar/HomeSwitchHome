class Auction < ApplicationRecord

  has_one :reservation
  belongs_to :residence
  belongs_to :user

  validates :amount, numericality: { greater_than: :amount_was }, if: :persisted?
  validates :residence_id, presence: true
  validates :startDate, presence: true
  validate :date_mayor_que_hoy
  #validate :fecha_no_repetida
  validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  private

  def fecha_no_repetida
    rep=false
    @auctions.each do |a|
      if a.startDate == startDate
        rep=true
        break
      end
    end
    if rep?
        errors.add(:startDate, "La fecha ingresada ya esta asignada a una subasta de esta residencia")
    end
  end

  def date_mayor_que_hoy
    if startDate.nil? || startDate < Date.today
      errors.add(:startDate, "Tiene que ser mayor a seis meses desde hoy")
    end
  end
end
