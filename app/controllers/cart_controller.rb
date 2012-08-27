class CartController < ApplicationController
  
  def add
    authorize! :add, :cart

    id = params[:id]

    cart = session[:cart] ||= {}
    cart[id] = ( cart[id] || 0 ) + 1

    redirect_to :dashboard
  end

  def index
    @cart = session[:cart] || {}
  end

  def change
    authorize! :change, :cart

    cart = session[:cart]
    id = params[:id];
    quantity = params[:quantity].to_i

    if cart && cart[id]
      unless quantity <= 0
        cart[id] = quantity
      else
        cart.delete id
      end
    else
      session.delete(:cart)
    end

    redirect_to :dashboard
  end

  def create_order_with_cart
    redirect_to :order
  end

end
