class BookingsController < ApplicationController
  def new
    selected_flights_ids = params[:flight].keys
    @flights = Flight.find(selected_flights_ids)

    @booking = Booking.new(flights: @flights)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flights = Flight.find(params[:flight_ids])

    if @booking.save
      send_confirmation_email
      redirect_to @booking, notice: 'Booking created!'
    else
      render :new, notice: 'Failed to save the booking'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def send_confirmation_email
    @booking.passengers.each do |passenger|
      PassengerMailer.with(passenger: passenger).confirm_booking.deliver_later
    end
  end

  def booking_params
    params.require(:booking).permit(
      passengers_attributes: %i[name email]
    )
  end
end
