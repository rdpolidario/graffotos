class CartController < ApplicationController
  # Non-RESTful
  authorize_resource class: false
  
  def add
    id = params[:id]
    
    if session[:cart]then
      cart=session[:cart]
    else
      session[:cart] = {}
      cart=session[:cart]
      
  end
  if cart[id] then 
    cart[id] = cart[id] + 1
  else
    cart[id] = 1
  end
    #cart = session[:cart] ||= {}
    #cart[id] = (cart[id] || 0) + 1
        
    redirect_to :action => :index
  end

  def index
    #@cart = session[:cart] || {}
    if session[:cart]then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  def change
  cart = session[:cart]
  id = params[:id];
  quantity = params[:quantity].to_i
  if cart and cart[id]
    unless quantity <= 0
      cart[id] = quantity
    else
      cart.delete id
    end
  end
    redirect_to :action => :index
  end
  
  def checkout
    flash[:notice] = "CHECKOUT IS NOT IMPLEMENTED YET!!!"
    redirect_to :action => :index
  end

end

