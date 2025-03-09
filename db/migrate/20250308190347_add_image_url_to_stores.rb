class AddImageUrlToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :image_url, :string
  end
end
