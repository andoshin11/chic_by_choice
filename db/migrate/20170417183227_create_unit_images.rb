class CreateUnitImages < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_images do |t|
      t.references :unit
      t.string :url, null: false
      t.string :name

      t.timestamps
    end
  end
end
