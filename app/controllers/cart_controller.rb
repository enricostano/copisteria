class CartController < ApplicationController
  #load_and_authorize_resource
  
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
end
