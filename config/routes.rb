Rails.application.routes.draw do
  # トップページを表示（未ログインでもアクセス可能）
  root to: "home#index"

  # Deviseのルート（ユーザー登録カスタマイズ）
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # 店舗の検索
  resources :stores, only: [ :index, :show ]

  # 管理者用（店舗管理）
  namespace :admin do
    resources :stores
  end

  # ユーザー認証が必要な機能（お気に入り・レビューなど）
  authenticate :user do
    resources :favorites, only: [ :create, :destroy ] # お気に入り機能（ログイン必須）
    resources :reviews, only: [ :create, :destroy ]   # レビュー機能（ログイン必須）
  end

  # Rails のヘルスチェック用
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA 関連
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
