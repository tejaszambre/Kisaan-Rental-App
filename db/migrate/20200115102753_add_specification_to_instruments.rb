class AddSpecificationToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :specification, :string
  end
end
