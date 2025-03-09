class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  def login
    @login || self.name || self.email
  end

  # Deviseの認証時に name または email で検索できるように修正
  def self.find_for_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions.to_h).where([ "name = :value OR email = :value", { value: login } ]).first
  end
end
