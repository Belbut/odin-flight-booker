class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirm_booking
    @passenger = params[:passenger]
    @flights = @passenger.booking.flights
    mail(to: @passenger.email, subject: "Your Booking was successful for #{@flights}")
  end
end
