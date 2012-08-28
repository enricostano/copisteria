class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @project_institutions = Project.nextbyinstitution
      @cart = session[:cart] || {}
      @orders_by_user = current_user.orders
      render "index"
    else
      render "splashpage", :layout => "splashpage"
    end
  end
end
