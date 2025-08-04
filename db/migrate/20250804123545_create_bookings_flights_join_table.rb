class CreateBookingsFlightsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :bookings, :flights do |t|
      # More common to want to query Booking.flights than vice versa
      t.index %i[booking_id flight_id]
      # t.index [:flight_id, :booking_id]
    end
  end
end
