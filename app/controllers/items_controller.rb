class ItemsController < ApplicationController

  before_action :set_merchant, except: [:update, :destroy]

  def index
    @items = @merchant.items
  end


end
