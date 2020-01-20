class CreateFarmerInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :farmer_instruments do |t|
      t.float :rent_per_hour
      t.boolean :is_available
      t.float :deposit
      t.datetime :next_available
      t.datetime :available_till

      t.timestamps
    end
  end
end
