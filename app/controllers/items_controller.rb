class ItemsController < ApplicationController
  skip_before_action :authenticate_customer!, only: [:index, :show]
  # before_action :authenticate_customer!, only: [:index, :show]
  #customer!もindexとshowと購入しかできないようにしたいから制限したい

  def index
  end
end
