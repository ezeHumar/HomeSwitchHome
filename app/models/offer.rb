class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :amount, numericality: { greater_than: 0 }

end
