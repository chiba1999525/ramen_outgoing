class AddCommodityToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :commodity, :string
  end
end
