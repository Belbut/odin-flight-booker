class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger
end
