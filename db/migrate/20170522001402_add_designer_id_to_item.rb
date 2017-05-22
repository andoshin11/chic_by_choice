class AddDesignerIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :designer_id, :integer
    add_index :items, :designer_id

    remove_column :items, :description, :text
    remove_column :items, :summary, :string
  end
end
