class AddDetailsToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :address, :string
    add_column :stores, :phone_number, :string
    add_column :stores, :hours, :string
  end
end
