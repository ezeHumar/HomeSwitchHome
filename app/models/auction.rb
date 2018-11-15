class Auction < ApplicationRecord
  belongs_to :residence
  validates :amount, allow_nil: true, numericality: { greater_than: :amount_was }
  validates_format_of :email, allow_nil: true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
