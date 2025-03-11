class Store < ApplicationRecord
    # 店のカテゴリー管理
    enum category: { Family_restaurant: 0, Western_food: 1, Japanese_food: 2, Chinese_food: 3, cafe: 4 }
    # エア管理
    enum :area, { tokyo: 0, osaka: 1, nagoya: 2 }, prefix: true
    # 必須情報（店名とエリア）
    validates :store_name, :area, presence: true

    #カテゴリi18nの設定
    def category_i18n
        I18n.t("activerecord.attributes.store.categories.#{category}", locale: :ja)
    end

    # エリアの日本語変換
    def area_i18n
    I18n.t("activerecord.attributes.store.areas.#{area}", locale: :ja)
    end
end
