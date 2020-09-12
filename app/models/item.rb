class Item < ApplicationRecord
  belongs_to :exhibition
  has_one :purchase
end
