class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :iso_code, null: false

      t.timestamps
    end
  end
end
