class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.integer :category, null: false
      t.references :item

      t.timestamps
    end
  end
end
