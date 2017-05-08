class UpdateUnitModel < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :size, :string
    add_column :units, :length, :string
    remove_column :units, :currency_id, :integer
    remove_column :units, :quantity, :string
    remove_column :units, :price, :float
    remove_column :units, :name, :string
  end
end
