class ExhibitionsController < ApplicationController
  before_action :set_exhibitions, only: :show

  def show
    # @items = Item.order('created_at DESC').includes(:exhibition)
    @items = @exhibition.items
    # current_user.nickname
    # @tweets = current_user.tweets
  end

  # @exhibition 


  private

  def set_exhibitions
    @exhibition =Exhibition.find(params[:id])
  end

end
