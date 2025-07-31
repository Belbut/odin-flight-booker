class FlightsController < ApplicationController
  def index
    flights = Flight.where('takeoff_time>=?', Date.current).order(:takeoff_time)
    @flights_options = flights.map(&:formatted_takeoff_date).uniq

    airports = Airport.order(:name)
    @airports_options = airports.map { |airport| [airport.name, airport.id] }
  end

  def show; end
end
