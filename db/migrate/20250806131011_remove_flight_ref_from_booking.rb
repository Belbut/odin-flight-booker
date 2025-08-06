class RemoveFlightRefFromBooking < ActiveRecord::Migration[8.0]
  def change
    remove_reference :bookings, :flight, null: false, foreign_key: true
  end
end
