class CartController < ApplicationController
  def add
    id = params[:id]

    cart = session[:cart] ||= {}
    cart[id] = ( cart[id] || 0 ) + 1

    redirect_to :action => :index
  end

  def index
    @cart = session[:cart] || {}
end
