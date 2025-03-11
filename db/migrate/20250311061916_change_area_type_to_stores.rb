#areaカラムをenumを使用するのでintegerの型にする
class ChangeAreaTypeToStores < ActiveRecord::Migration[7.2]
  def change
    change_column :stores, :area, :integer, using: 'area::integer'
  end
end
