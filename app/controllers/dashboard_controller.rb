class DashboardController < ApplicationController
  def index
    @project_institutions = Project.nextbyinstitution
  end
end
