class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    selected_flights_ids = params[:flight].keys
    @flights = Flight.find(selected_flights_ids)

    number_of_passengers = params[:number_passengers].to_i
    number_of_passengers.times { @booking.passengers.build }
  end

  def create; end
end
