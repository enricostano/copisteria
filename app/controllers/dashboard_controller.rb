class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @project_institutions = Project.nextbyinstitution
      if current_user.role? :user 
        @cart = session[:cart] || {}
        @orders_by_user = current_user.orders.order('created_at DESC')
      end
      render "index"
    else
      render "splashpage", :layout => "splashpage"
    end
  end
end
