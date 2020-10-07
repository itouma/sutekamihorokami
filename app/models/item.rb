class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :exhibition
  has_one :purchase
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :item_status

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 100 }
    validates :category, :item_status
    with_options numericality: true do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 99_999, message: :'Out of setting range' }
    end
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :exhibition_id
  end
  validates :weight, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 15 }
  validates :cost, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
end
