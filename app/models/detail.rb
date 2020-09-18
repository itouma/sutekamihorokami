class Detail < ApplicationRecord
  belongs_to :purchase
  with_options presence: true do
    validates :deatailday
    validates :purchase_id 
  end
end
