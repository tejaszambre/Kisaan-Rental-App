class Rent < ApplicationRecord
  belongs_to :farmer_instrument
  belongs_to :farmer

  validates :from_date, :to_date, presence: true

end
