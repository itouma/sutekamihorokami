class PurchasesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_item, only: [:index, :create,:pay_item]
  def index
    if @item.purchase.present? || exhibition_signed_in?
      redirect_to root_path 
    else
      @detail =PurchaseDetail.new
    end

  end

  def create
    @detail =PurchaseDetail.new(detail_params)
    if @detail.valid?
      pay_item
      @detail.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def detail_params
    params.require(:purchase_detail).permit(:deatailday).merge(customer_id: current_customer.id, item_id: @item.id, token: params[:token])
    
  end
end

