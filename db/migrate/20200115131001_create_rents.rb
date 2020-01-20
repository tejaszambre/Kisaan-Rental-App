class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
