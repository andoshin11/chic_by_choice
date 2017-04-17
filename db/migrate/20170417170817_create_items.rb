class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :category_id, index: true
      t.text :description

      t.timestamps
    end
  end
end
