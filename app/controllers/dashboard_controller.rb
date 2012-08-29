class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @project_institutions = Project.nextbyinstitution
      if current_user.any_role? :super_admin, :admin
		    @orders = Order.order('created_at DESC').limit(10)
      else
        @cart = session[:cart] ||= {}
        @orders_by_user = current_user.orders.order('created_at DESC')
      end
      render "index"
    else
      render "splashpage", :layout => "splashpage"
    end
  end
end
