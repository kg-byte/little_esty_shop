class ApplicationController < ActionController::Base
 def set_merchant
    @merchant = Merchant.find(params[:id])
  end


end
