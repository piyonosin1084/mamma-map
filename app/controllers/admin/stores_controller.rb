class Admin::StoresController < ApplicationController
  # ログインしていないユーザーをログインページにリダイレクト
  before_action :authenticate_user!
  # 管理者以外をroot_pathにリダイレクト
  before_action :authorize_admin
  # edit, update, destroyアクションの前に@storeの情報を取得
  before_action :set_store, only: [:edit, :update, :destroy]

  # 店舗一覧（storesを取得してindex.html.erbに渡す）
  def index
    @stores = Store.order(id: :asc)
  end

  # 新しい店舗作成（空の@storeインスタンスを作成してnew.html.erbに渡す）
  def new
    @store = Store.new
  end

  # 店舗情報を保存
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_stores_path, notice: "店舗を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 既存の店舗情報を編集
  def edit
  end

  # 店舗情報を更新
  def update
    if @store.update(store_params)
      redirect_to admin_stores_path, notice: "店舗情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 店舗情報削除
  def destroy
    @store.destroy
    redirect_to admin_stores_path, notice: "店舗情報を削除しました。"
  end

  private

  # before_actionでedit, update, destroyで呼び出される
  def set_store
    @store = Store.find(params[:id])
  end

  # 許可されたパラメーターのみを通す
  def store_params
    params.require(:store).permit(
      :store_name, :category, :area, :address, :phone_number, :hours, :image_url,
      *Store.kids_friendly_attributes
    )
  end

  # 管理者のみアクセス許可
  def authorize_admin
    redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
  end
end
