class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @tender_institutions = Tender.nextbyinstitution
      if current_user.any_role? :super_admin, :admin
		    @orders = Order.order('created_at DESC').limit(10)
      else
        @cart = session[:cart] ||= {}
        @orders_by_user = current_user.orders.order('created_at DESC')
      end
      render "index"
    else
      render "splashpage"
    end
  end
end
