class Booking < ApplicationRecord
  has_and_belongs_to_many :flights

  has_many :passengers
  accepts_nested_attributes_for :passengers

  def to_s
    id.to_s.rjust(8, '0')
  end
end
