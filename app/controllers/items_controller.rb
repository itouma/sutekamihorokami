class ItemsController < ApplicationController
  # before_action :authenticate_customer!
  # skip_before_action :authenticate_customer!, only: [:index, :show]
  before_action :authenticate_exhibition!
  skip_before_action :authenticate_exhibition!, only: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]
  #customer!もindexとshowと購入しかできないようにしたいから制限したいあっちで設定

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  private

  # def move_to_index
  #   if customer_signed_in? && @customer.id == current_customer.id 
  #     redirect_to action: :index
  #   end
  # end

  # def item_params
  #   params.require(:item).permit(:image, :name, :text, :category_id, :price, :exhibition_id, :item_status_id,:cost, :weight)
  # end

end
