class Residence < ApplicationRecord
  has_many :auctions

  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
end
