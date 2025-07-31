class FlightsController < ApplicationController
  def index
    @flight = Flight.new

    flights = Flight.where('takeoff_time>=?', Date.current).order(:takeoff_time)
    @flights_options = flights.map(&:formatted_takeoff_date).uniq

    airports = Airport.order(:name)
    @airports_options = airports.map { |airport| [airport.name, airport.id] }

    return if params[:flight].nil?

    @queried_flights = flight_query
  end

  def show; end

  protected

  def flight_params
    { from: params[:flight][:departure_airport],
      to: params[:flight][:arrival_airport],
      date: params[:flight][:flight_date] }
  end

  def flight_query
    query = Flight.order(:takeoff_time)

    query = query.where('departure_airport_id = :from', flight_params) unless flight_params[:from].empty?
    query = query.where('arrival_airport_id = :to', flight_params) unless flight_params[:to].empty?
    if flight_params[:date].empty?
      query.where('takeoff_time >= ?', Date.current)
    else
      query.where('takeoff_time = :date', flight_params)
    end
  end
end
