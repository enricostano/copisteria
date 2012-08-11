class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @project_institutions = Project.nextbyinstitution
      render "index"
    else
      render "splashpage", :layout => "splashpage"
    end
  end
end
