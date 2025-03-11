class AddChildFriendlyFeaturesToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :private_room, :integer
    add_column :stores, :tatami, :integer
    add_column :stores, :kids_chair, :integer
    add_column :stores, :stroller, :integer
    add_column :stores, :allergy_menu, :integer
    add_column :stores, :kids_space, :integer
    add_column :stores, :diaper_changing, :integer
    add_column :stores, :nursing_room, :integer
  end
end
