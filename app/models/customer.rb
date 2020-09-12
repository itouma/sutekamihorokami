class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :purchase
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # 半角英数字
  HIRAGANA_KATAKANA_REGEX = /\A(?:\p{Hiragana}|[ァ-ヶー－]|[ー－]|[一-龠々]|[０-９ａ-ｚＡ-Ｚ])+\z/.freeze
  # 全角文字のみ
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  # 全角カタカナのみ
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: HIRAGANA_KATAKANA_REGEX, message: 'Full-width characters' } do
      validates :first_name
      validates :family_name
    end
    with_options format: { with: KATAKANA_REGEX, message: 'Full-width katakana characters' } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' } 
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format:
    { with: /\A[0-9]{,11}\z/, message: 'is invalid. Include hyphen(-)' }, length: { maximum: 11 }
    validates :city
    validates :city_number
  end
  with_options presence: { message: 'Select' } do
    validates :prefecture_id, numericality: { greater_than: 0, message: 'Select' }
  end

end
