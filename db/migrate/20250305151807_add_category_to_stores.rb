class AddCategoryToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :category, :integer
  end
end
