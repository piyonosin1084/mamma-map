class Store < ApplicationRecord
    # 店のカテゴリー管理
    enum category: { Family_restaurant: 0, Western_food: 1, Japanese_food: 2, Chinese_food: 3, cafe: 4 }
    #店のエリア
    enum :area, { tokyo: 0, osaka: 1, nagoya: 2 }, prefix: true
    # 必須情報
    validates :store_name, presence: true

    #カテゴリi18nの設定
    def category_i18n
        I18n.t("activerecord.attributes.store.categories.#{category}", locale: :ja)
    end

    #エリアのi18n
    def area_i18n
    I18n.t("activerecord.attributes.store.areas.#{area}", locale: :ja)
    end

    #子連れ情報i18n
    def self.kids_friendly_i18n(attr)
    I18n.t("activerecord.attributes.store.kids_friendly.#{attr}", locale: :ja)
    end

    def self.kids_friendly_attributes
    %w[private_room tatami kids_chair stroller allergy_menu kids_space diaper_changing nursing_room]
    end
end
