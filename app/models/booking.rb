class Booking < ApplicationRecord
  has_and_belongs_to_many :flights

  has_many :passengers
  accepts_nested_attributes_for :passengers
end
