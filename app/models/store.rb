class Store < ApplicationRecord
  # 店のカテゴリー管理
  enum :category, { Family_restaurant: 0, Western_food: 1, Japanese_food: 2, Chinese_food: 3, cafe: 4 }

  # 店のエリア管理
  enum :area, { tokyo: 0, osaka: 1, nagoya: 2 }, prefix: true

  # 子連れ向け情報
  enum :private_room, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :tatami, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :kids_chair, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :stroller, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :allergy_menu, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :kids_space, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :diaper_changing, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown
  enum :nursing_room, { unknown: 0, available: 1, not_available: 2 }, prefix: true, default: :unknown

  # 必須情報（店名とエリア）
  validates :store_name, :area, presence: true

  # カテゴリー i18n
  def category_i18n
    I18n.t("activerecord.attributes.store.categories.#{category}", locale: :ja)
  end

  # エリア i18n
  def area_i18n
    I18n.t("activerecord.attributes.store.areas.#{area}", locale: :ja, default: "未設定")
  end

  # 子連れ向け情報の i18n
  def private_room_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.private_room.#{private_room}", locale: :ja)
  end

  def tatami_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.tatami.#{tatami}", locale: :ja)
  end

  def kids_chair_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.kids_chair.#{kids_chair}", locale: :ja)
  end

  def stroller_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.stroller.#{stroller}", locale: :ja)
  end

  def allergy_menu_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.allergy_menu.#{allergy_menu}", locale: :ja)
  end

  def kids_space_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.kids_space.#{kids_space}", locale: :ja)
  end

  def diaper_changing_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.diaper_changing.#{diaper_changing}", locale: :ja)
  end

  def nursing_room_i18n
    I18n.t("activerecord.attributes.store.kids_friendly.nursing_room.#{nursing_room}", locale: :ja)
  end

  # ✅ 子連れ向け情報の属性一覧を取得
  def self.kids_friendly_attributes
    %w[private_room tatami kids_chair stroller allergy_menu kids_space diaper_changing nursing_room]
  end

  # ✅ 子連れ向け情報の i18n ラベルを取得
  def self.kids_friendly_i18n(attr)
  I18n.t("activerecord.attributes.store.kids_friendly_labels.#{attr}", locale: :ja)
  end

  #レビュー情報の関連付け
  has_many :reviews, dependent: :destroy
end
