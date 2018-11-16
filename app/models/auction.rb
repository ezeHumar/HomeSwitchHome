class Auction < ApplicationRecord
  belongs_to :residence
  validates :amount, numericality: { greater_than: :amount_was }, if: :persisted?
  validate :date_mayor_que_seis_meses
  validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  private

  def date_mayor_que_seis_meses
    if startDate < Date.today + 6.months
      errors.add(:startDate, "Tiene que ser mayor a seis meses desde hoy")
    end
  end
end
