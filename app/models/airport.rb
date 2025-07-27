class Airport < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true, length: { is: 4 }

  has_many :departing_flights, foreign_key: 'departure_airport_id'
  has_many :arriving_flights, foreign_key: 'arrival_airport_id'

  alias_attribute :icao_code, :code
end
