class Auction < ApplicationRecord
  belongs_to :residence
  validates :amount, numericality: { greater_than: :amount_was }
end
