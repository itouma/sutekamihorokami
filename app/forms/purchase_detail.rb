class PurchaseDetail
  include ActiveModel::Model
  attr_accessor :item_id, :customer_id, :deatailday, :token

  with_options presence: true do
    validates :token
    validates :customer_id, numericality: { only_integer: true }
    validates :item_id, numericality: { only_integer: true }
    validates :deatailday
  end

  def save
    purchase = Purchase.create(customer_id: customer_id, item_id: item_id)

    Detail.create(deatailday: deatailday, purchase_id: purchase.id)
  end
end
