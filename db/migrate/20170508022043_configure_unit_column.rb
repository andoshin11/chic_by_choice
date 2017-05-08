class ConfigureUnitColumn < ActiveRecord::Migration[5.0]
  def up
    change_column :units, :size, :string, null: false
    change_column :units, :length, :string, null: false
  end

  def down
    change_column :units, :size, :string
    change_column :units, :length, :string
  end
end
