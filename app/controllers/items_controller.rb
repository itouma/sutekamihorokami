class ItemsController < ApplicationController
  skip_before_action :authenticate_customer!, only: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]
  #customer!もindexとshowと購入しかできないようにしたいから制限したいあっちで設定

  def index
  end



  private

  # def move_to_index
  #   if customer_signed_in? && @customer.id == current_customer.id 
  #     redirect_to action: :index
  #   end
  # end

end
