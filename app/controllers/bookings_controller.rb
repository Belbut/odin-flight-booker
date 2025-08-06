class BookingsController < ApplicationController
  def new
    selected_flights_ids = params[:flight].keys
    @flights = Flight.find(selected_flights_ids)

    @booking = Booking.new(flights: @flights)

    number_of_passengers = params[:number_passengers].to_i
    number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flights = Flight.find(params[:flight_ids])

    if @booking.save
      redirect_to root_path, notice: 'Booking created!'
    else
      render :new, notice: 'Failed to save the booking'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      passengers_attributes: %i[name email]
    )
  end
end
