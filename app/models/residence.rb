class Residence < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true

  #belongs_to :auction
end
