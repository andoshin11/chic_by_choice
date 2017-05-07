class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user

      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart, null: false
      t.references :unit, null: false
      t.references :currency, null: false
      t.string :name, null: false
      t.float :price, null: false
      t.integer :num_units

      t.timestamps
    end
  end
end
