class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only:[:new, :create]
  before_filter :get_user

  def show
  end

  def invite
    @user = User.find(params[:id])

    params[:project].each do |project_id|
      @project = current_user.projects.find(project_id)
      @user.projects << @project
    end
    redirect_to :back, notice: 'User invited successfully.'
  end

  def own_projects
    @user = current_user
    @projects = @user.projects
  end

  def own_tasks
    @user = current_user
    @tasks = @user.tasks
  end


##################
  private

  def get_user
    @user = User.find(params[:id])
  end

end