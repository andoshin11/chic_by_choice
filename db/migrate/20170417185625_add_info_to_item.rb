class AddInfoToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :name, :string
    add_column :items, :summary, :string
    add_column :items, :detail, :text
    add_column :items, :currency_id, :integer
    add_column :items, :hire_price, :float
    add_column :items, :retail_price, :float
  end
end
