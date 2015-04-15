class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart_details
  
  def set_cart_details
    cart = session[:cart]
    @total_price = 0
    
    if(cart)
      @total_items = session[:cart].size
      cart.each do| id, quantity|
      item = Item.find_by_id(id)
      @total_price += quantity * item.price
    end
    
    else
        @total_items = 0
    end 
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'You need to login first to add to cart.'
    redirect_to :back


	end
  
end