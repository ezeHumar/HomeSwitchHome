class Residence < ApplicationRecord
  has_many :auctions
  has_many :reservations
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true
  validates :capacity, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :address, presence: true
end
