class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :auction, optional: true
  belongs_to :residence
  has_one :hotsale

  validates :reservation_date, uniqueness: {scope: :residence_id}


end
