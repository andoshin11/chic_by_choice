class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :unit
      t.references :favorite_list
      t.timestamps
    end
  end
end
