class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  has_one :detail
end
