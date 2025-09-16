class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_and_belongs_to_many :bookings
  has_many :passengers, through: :bookings

  def formatted_takeoff_date
    takeoff_time.strftime('%d/%m/%Y')
  end

  def formatted_takeoff_time
    takeoff_time.strftime('%H:%M')
  end

  # etd = estimated time of departure
  def etd
    formatted_takeoff_time
  end

  # ete = estimated time in route
  def ete
    hours = duration_in_minutes / 60
    minutes = duration_in_minutes % 60
    "#{hours.to_s.rjust(2, '0')}H#{minutes.to_s.rjust(2, '0')}"
  end

  def to_s
    "#{departure_airport.code}->#{arrival_airport}.code"
  end
end
