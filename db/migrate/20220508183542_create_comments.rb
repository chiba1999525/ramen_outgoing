class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :item_id
      t.text :name
      t.integer :count

      t.timestamps
    end
  end
end
