class HomeController < ApplicationController
  def index
    @stores = Store.all #storeモデルから全ての店舗を取得
  end
end
