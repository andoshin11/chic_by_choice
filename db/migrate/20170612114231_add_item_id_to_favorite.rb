class AddItemIdToFavorite < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :item_id, :integer

    remove_column :favorites, :unit_id, :integer
  end
end
