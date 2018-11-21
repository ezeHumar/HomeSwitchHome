class Residence < ApplicationRecord
  has_many :auctions
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
end
