class ItemsController < ApplicationController

  before_action :set_merchant, except: [:update, :destroy]

  def index
    @items = @merchant.items
  end

  def show
    @item = @merchant.items.find(params[:item_id])
  end

end
