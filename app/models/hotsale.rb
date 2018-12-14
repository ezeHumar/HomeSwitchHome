class Hotsale < ApplicationRecord
  belongs_to :reservation

  validates :amount, presence: true
  validates :amount, numericality: { only_float: true, greater_than: 0 }
  validates :reservation_id, presence: true
  validates :name, presence: true

end
