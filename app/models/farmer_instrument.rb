class FarmerInstrument < ApplicationRecord
  belongs_to :farmer
  belongs_to :instrument
  has_one :rent

  validates :rent_per_hour, :deposit , presence: true
  # def add_far_instru
  #   far = gets.chomp
  #   ins = gets.chomp
  #   self.update(farmer_id: far, instrument_id: ins)
  # end

end
