class Residence < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :photos, presence: true

  belongs_to :auction
end
