class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: "店舗が正常に登録されました。" }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: "店舗情報が更新されました。" }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy!

    respond_to do |format|
      format.html { redirect_to stores_path, status: :see_other, notice: "店舗が削除されました。" }
      format.json { head :no_content }
    end
  end

  def search
    @stores = Store.all

    # エリアで絞り込み
    @stores = @stores.where(area: params[:area]) if params[:area].present?

    # ジャンルで絞り込み
    @stores = @stores.where(category: params[:category]) if params[:category].present?

    render :search_results
  end

  private

  # 共通の設定や制約を適用するためのコールバック
  def set_store
    @store = Store.find(params[:id])
  end

  # 許可されたパラメータのみを通す
  def store_params
    params.require(:store).permit(:store_name, :area, :category)
  end
end
