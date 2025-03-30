Rails.application.routes.draw do
  # トップページを表示（未ログインでもアクセス可能）
  root to: "home#index"

  # Deviseのルート（ユーザー登録カスタマイズ）
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # 店舗の検索&一覧表示
  resources :stores, only: [ :index, :show ] do
    collection do
      get :search
    end

    #レビュー投稿機能をstoresにネスト（ログイン済ユーザーのみアクセス）
    authenticate :user do
      resources :reviews, only: [ :new, :create ]
    end
  end

  # 管理者用（店舗管理）
  namespace :admin do
    resources :stores
  end

  # ユーザー認証が必要な機能（お気に入り）
  authenticate :user do
    resources :favorites, only: [ :create, :destroy ]
  end

  # Rails のヘルスチェック用
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA 関連
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
