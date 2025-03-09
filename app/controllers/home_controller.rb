class HomeController < ApplicationController
  def index
    @stores = Store.where(store_name: "gohan") # storeモデルから全ての店舗を取得
  end
end
