class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @flights_options = Flight.all.map { |flight| [flight.formatted_takeoff_date, flight.id] }
  end

  def show; end
end
