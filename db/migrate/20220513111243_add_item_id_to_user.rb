class AddItemIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :item_id, :integer
  end
end
