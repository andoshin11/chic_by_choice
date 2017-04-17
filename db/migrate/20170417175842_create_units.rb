class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.references :item
      t.references :currency
      t.string :quantity
      t.float :price, null: false, default: 0
      t.string :name, null: false

      t.timestamps
    end
  end
end
