class AddAreaToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :area, :string
  end
end
