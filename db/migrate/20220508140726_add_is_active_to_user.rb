class AddIsActiveToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_sctive, :boolean
  end
end
