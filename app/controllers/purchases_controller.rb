class PurchasesController < ApplicationController
  # before_action :authenticate_customer!
  before_action :set_item, only: [:index, :create,:show,]
  def index
    @detail =PurchaseDetail.new
    # binding.pry
  end

  # def new
  #   @exhibition =Purchase.new
  # end

  def create
    @detail =PurchaseDetail.new(detail_params)
    @donation.save
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def detail_params
    params.require(:purchase_detail).permit(:deatailday).merge(customer_id:current_customer.id, item_id: @item.id,token: params[:token])
    
  end
end
