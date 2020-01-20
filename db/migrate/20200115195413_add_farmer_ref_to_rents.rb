class AddFarmerRefToRents < ActiveRecord::Migration[5.2]
  def change
    add_reference :rents, :farmer, foreign_key: true
    add_reference :rents, :farmer_instrument, foreign_key: true
  end
end
