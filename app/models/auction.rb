class Auction < ApplicationRecord
  belongs_to :residence
  validates :amount, numericality: { greater_than: :amount_was }, if: :persisted?
  validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
