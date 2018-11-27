class Auction < ApplicationRecord

  has_one :reservation
  belongs_to :residence
  belongs_to :user

  validates :amount, numericality: { greater_than: :amount_was }, if: :persisted?
  validates :residence_id, presence: true
  validate :date_mayor_que_hoy
  validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  private

  def date_mayor_que_hoy
    if startDate < Date.today
      errors.add(:startDate, "Tiene que ser mayor a seis meses desde hoy")
    end
  end
end
