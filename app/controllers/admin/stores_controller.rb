class Admin::StoresController < ApplicationController
    # ログインしていないユーザーをログインページにリダイレクト
    before_action :authenticate_user!
    # 管理者以外をroot_pathにリダイレクト
    before_action :authorize_admin
    # edit,update,destroyアクションの前に@storeの情報を取得
    before_action :set_store, only: [ :edit, :update, :destroy ]

    # 店舗一覧（storesを取得してindex.html.erbに渡してる）
    def index
      @stores = Store.all.order(id: "ASC")
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
    # 成功時はadmin_stores_pathにリダイレクトして通知 (flash[:notice])
    # 失敗時はedit.html.erbを再表示→エラーメッセージを表示
    def update
      if @store.update(store_params)
        redirect_to admin_stores_path, notice: "店舗情報を更新しました。"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # 店情報削除
    # 成功したらadmin_stores_pathにリダイレクトして、通知 (flash[:notice]) を表示
    def destroy
      @store.destroy
      respond_to do |format|
        format.html { redirect_to admin_stores_path, notice: "店舗情報を削除しました。", status: :see_other }
        format.json { head :no_content }
      end
    end

    def show
    redirect_to admin_stores_path
    end

    private

    # before_actionでedit,update,destroyで呼び出される
    def set_store
      @store = Store.find(params[:id])
    end

    # ストリングパラメーター
    def store_params
      params.require(:store).permit(
    :store_name, :category, :area, :address, :phone_number, :hours, :image_url,
    :private_room, :tatami, :kids_chair, :stroller,
    :allergy_menu, :kids_space, :diaper_changing, :nursing_room
  )
    end

    # 管理者のみアクセス許可
    def authorize_admin
      redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
    end
end
