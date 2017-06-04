class AddSizeToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :size, :string
    add_column :cart_items, :length, :string
    add_column :cart_items, :priority, :integer, null: false, default: 0
    add_column :cart_items, :period, :integer, null: false, default: 4
    add_column :cart_items, :event_date, :date, null: false, default: Date.today
    add_column :cart_items, :delivery_date, :date, null: false, default: Date.today
    add_column :cart_items, :return_date, :date, null: false, default: Date.today
    add_column :cart_items, :designer_name, :string
    add_column :cart_items, :item_name, :string

    remove_column :cart_items, :name, :string
    remove_column :cart_items, :num_units, :integer
  end
end
