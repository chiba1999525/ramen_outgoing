class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image_id
      t.string :name
      t.text :body
      t.string :place
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
