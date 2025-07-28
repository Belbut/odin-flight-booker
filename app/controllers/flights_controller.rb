class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map { |airport| [airport.name, airport.id] }
    puts "********************************* #{@airports_options}"
  end

  def show; end
end
