class AddStateAndCountryToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
  end
end
