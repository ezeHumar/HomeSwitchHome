class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :auction, optional: true
  belongs_to :residence


end
