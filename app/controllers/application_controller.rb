class ApplicationController < ActionController::Base
 def set_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end


end
