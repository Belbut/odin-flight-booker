class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def formatted_takeoff_date
    takeoff_time.strftime('%d/%m/%Y')
  end

  # ete = estimated time in route
  def ete
    hours = duration_in_minutes / 60
    minutes = duration_in_minutes % 60
    "#{hours.to_s.rjust(2, '0')}H#{minutes.to_s.rjust(2, '0')}"
  end
end
