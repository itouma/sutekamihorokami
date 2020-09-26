class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  # 全角カタカナのみ

  geocoded_by :city
  after_validation :geocode

  with_options presence: true do
    validates :company_name
    validates :company_name_kana, format: { with: KATAKANA_REGEX, message: 'Full-width katakana characters' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format:
    { with: /\A[0-9]{,11}\z/, message: 'is invalid. Include hyphen(-)' }, length: { maximum: 11 }
    validates :city
  end
  with_options presence: { message: 'Select' } do
    validates :prefecture_id, numericality: { greater_than: 0, message: 'Select' }
  end

end
