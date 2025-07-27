# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PORTUGUESE_MILITARY_AIRPORTS = [
  { name: 'Beja Airport', code: 'LPBJ' },
  { name: 'Sintra Airport', code: 'LPST' },
  { name: 'Monte Real Air Base', code: 'LPMR' },
  { name: 'Ovar Air Base', code: 'LPOV' },
  { name: 'Montijo Air Base', code: 'LPMT' },
  { name: 'Lajes Field', code: 'LPLA' },
  { name: 'Tancos Airfield', code: 'LCTN' },
  { name: 'Ota Air Base', code: 'LPOA' }
]

PORTUGUESE_MILITARY_AIRPORTS.each do |airport|
  Airport.find_or_create_by!(name: airport[:name], code: airport[:code])
end

# ETD - Estimated Time of Departure
# ETE - Estimated Time En-route
TEST_FLIGHTS = [
  { ETD: 5.days.ago, ETE: 90, departure_airport: 'LPBJ', arrival_airport: 'LPST' },
  { ETD: 3.days.ago, ETE: 75, departure_airport: 'LPMR', arrival_airport: 'LPLA' },
  { ETD: 2.days.ago, ETE: 120, departure_airport: 'LPMT', arrival_airport: 'LPOV' },
  { ETD: 1.day.ago, ETE: 95, departure_airport: 'LPLA', arrival_airport: 'LPST' },
  { ETD: Time.now - 6.hours, ETE: 65, departure_airport: 'LPOA', arrival_airport: 'LPMR' },
  { ETD: Time.now - 1.hour, ETE: 80, departure_airport: 'LPMT', arrival_airport: 'LCTN' },
  { ETD: Time.now, ETE: 130, departure_airport: 'LPOV', arrival_airport: 'LPMT' },
  { ETD: Time.now + 1.hour, ETE: 110, departure_airport: 'LPBJ', arrival_airport: 'LPMR' },
  { ETD: Time.now + 2.hours, ETE: 70, departure_airport: 'LPST', arrival_airport: 'LPLA' },
  { ETD: Time.now + 4.hours, ETE: 100, departure_airport: 'LCTN', arrival_airport: 'LPOV' },
  { ETD: 1.day.from_now, ETE: 140, departure_airport: 'LPMR', arrival_airport: 'LPMT' },
  { ETD: 2.days.from_now, ETE: 85, departure_airport: 'LPMT', arrival_airport: 'LPBJ' },
  { ETD: 3.days.from_now, ETE: 125, departure_airport: 'LPLA', arrival_airport: 'LPST' },
  { ETD: 4.days.from_now, ETE: 70, departure_airport: 'LPOV', arrival_airport: 'LCTN' },
  { ETD: 5.days.from_now, ETE: 60, departure_airport: 'LPBJ', arrival_airport: 'LPMT' },
  { ETD: 6.days.from_now, ETE: 105, departure_airport: 'LPMR', arrival_airport: 'LPLA' },
  { ETD: 7.days.from_now, ETE: 95, departure_airport: 'LPOV', arrival_airport: 'LPMR' },
  { ETD: 8.days.from_now, ETE: 135, departure_airport: 'LCTN', arrival_airport: 'LPMT' },
  { ETD: 9.days.from_now, ETE: 80, departure_airport: 'LPST', arrival_airport: 'LPMT' },
  { ETD: 10.days.from_now, ETE: 150, departure_airport: 'LPMR', arrival_airport: 'LPBJ' },
  { ETD: 11.days.from_now, ETE: 90, departure_airport: 'LPMT', arrival_airport: 'LPOA' },
  { ETD: 12.days.from_now, ETE: 110, departure_airport: 'LPLA', arrival_airport: 'LPOV' },
  { ETD: 13.days.from_now, ETE: 100, departure_airport: 'LCTN', arrival_airport: 'LPMT' },
  { ETD: 14.days.from_now, ETE: 75, departure_airport: 'LPOA', arrival_airport: 'LPST' },
  { ETD: 15.days.from_now, ETE: 85, departure_airport: 'LPST', arrival_airport: 'LPMR' },
  { ETD: 16.days.from_now, ETE: 70, departure_airport: 'LPMT', arrival_airport: 'LPBJ' },
  { ETD: 17.days.from_now, ETE: 115, departure_airport: 'LPLA', arrival_airport: 'LPMT' },
  { ETD: 18.days.from_now, ETE: 125, departure_airport: 'LPMR', arrival_airport: 'LCTN' },
  { ETD: 19.days.from_now, ETE: 105, departure_airport: 'LPBJ', arrival_airport: 'LPLA' },
  { ETD: 20.days.from_now, ETE: 95, departure_airport: 'LCTN', arrival_airport: 'LPOA' }
]

puts
TEST_FLIGHTS.each do |flight|
  Flight.find_or_create_by!(
    takeoff_time: flight[:ETD],
    duration_in_minutes: flight[:ETE],
    departure_airport: Airport.find_by(code: flight[:departure_airport]),
    arrival_airport: Airport.find_by(code: flight[:arrival_airport])
  )
end
