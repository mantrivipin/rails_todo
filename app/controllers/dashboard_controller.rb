class DashboardController < ApplicationController
  def index
    if current_user.admin?
      if params[:filter_by].present? && params[:filter_by] == 'project'
        @projects = Project.includes(:tasks).all
        @project_count = @projects.size
      else
        @project_count = Project.count
        @users = User.all
        @tasks = Task.all
      end
    else
      @tasks = Task.includes(:project).where(user_id: current_user.id)
    end
  end
end
