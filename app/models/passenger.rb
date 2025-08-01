class Passenger < ApplicationRecord
  belongs_to :booking

  validate :name, presence: true
end
