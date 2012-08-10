class DashboardController < ApplicationController
  def index
    @projects = Project.where('stop > ?', Date.today)
    @project_institutions = @projects.group_by { |p| p.institution }
  end
end
