class Store < ApplicationRecord
    # 店のカテゴリー管理
    enum category: { Family_restaurant: 0, Western_food: 1, Japanese_food: 2, Chinese_food: 3, cafe: 4 }
    # 必須情報
    validates :store_name, presence: true

    #カテゴリi18nの設定
    def category_i18n
        I18n.t("activerecord.attributes.store.categories.#{category}", locale: :ja)
    end

end
