class Airport < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true, length: { is: 4 }

  has_many :departing_flights, class_name: 'Flight'
  has_many :arriving_flights, class_name: 'Flight'

  alias_attribute :icao_code, :code
end
