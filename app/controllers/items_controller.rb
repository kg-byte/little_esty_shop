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
    if item.update(item_params)
      item.update(item_params)
      if item_params[:status] 
        redirect_to "/merchants/#{@merchant.id}/items"
      elsif
        redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"
      end
    else 
      redirect_to "/merchants/#{@merchant.id}/items/#{item.id}/edit"
      flash[:alert] = "Error: all required fields must be filled!}"
    end
  end

private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :status)
  end

end
