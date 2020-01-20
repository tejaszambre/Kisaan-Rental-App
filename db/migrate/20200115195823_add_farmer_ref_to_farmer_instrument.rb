class AddFarmerRefToFarmerInstrument < ActiveRecord::Migration[5.2]
  def change
    add_reference :farmer_instruments, :farmer, foreign_key: true
    add_reference :farmer_instruments, :instrument, foreign_key: true
  end
end
