class ItemsController < ApplicationController

  before_action :set_merchant#, except: [:update, :destroy]

  def index
    @items = @merchant.items
  end

  def show
    @item = @merchant.items.find(params[:item_id])
  end

  def edit
    @item = @merchant.items.find(params[:item_id])
  end

  def update
    item = Item.find(params[:item_id])
    if item.update(item_prams)
      item.update(item_prams)
      redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"
    else 
      redirect_to "/merchants/#{@merchant.id}/items/#{item.id}/edit"
      flash[:alert] = "Error: all required fields must be filled!}"
    end
  end

private
  def item_prams
    params.permit(:id, :name, :description, :unit_price)
  end

end
