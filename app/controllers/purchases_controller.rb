class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :show, :destroy, :edit, :update]
  def index
    @detail =Purchase.new
    # binding.pry
  end

  # def new
  #   @exhibition =Purchase.new
  # end

  def create
    @detail =Purchase.create(detail_params)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  
  def detail_params
    params.require(:purchase).permit(:item, :customer)
  end
end
