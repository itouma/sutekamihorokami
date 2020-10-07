class ItemsController < ApplicationController
  # before_action :authenticate_customer!
  # skip_before_action :authenticate_customer!, only: [:index, :show]
  before_action :authenticate_exhibition!
  skip_before_action :authenticate_exhibition!, only: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]
  # customer!もindexとshowと購入しかできないようにしたいから制限したいあっちで設定
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.order('created_at DESC').includes(:exhibition)
    # gon.exhibition = current_exhibition
    # gon.customer = current_customer
    gon.user = if customer_signed_in?
                 current_customer
               elsif exhibition_signed_in?
                 current_exhibition
               else
                 Customer.new(latitude: 35.681236, longitude: 139.767125)
               end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if exhibition_signed_in? && current_exhibition.id == @item.exhibition.id && @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if exhibition_signed_in? && current_exhibition.id == @item.exhibition.id
      @item.delete
      redirect_to root_path
    else
      render :show
    end
  end

  private

  # def move_to_index
  #   if customer_signed_in? && @customer.id == current_customer.id
  #     redirect_to action: :index
  #   end
  # end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :price, :exhibition_id, :item_status_id, :cost, :weight).merge(exhibition_id: current_exhibition.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
