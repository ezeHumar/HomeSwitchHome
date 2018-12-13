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

  def country_name
    country = self.country
    ISO3166::Country.new(country).translation("es")
  end

  include PgSearch

  pg_search_scope :search_by_parameter, :against => {
    :name => 'A',
    :location => 'B',
    :city => 'C',
    :zip => 'C',
    :address=> 'C'
  }

end
