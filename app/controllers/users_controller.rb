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
    # ProjectMailer.project_invitation(@user).deliver
    redirect_to :back, notice: 'User invited successfully.'
  end

  def own_projects
    @projects = current_user.projects
  end

  def own_tasks
    @projects = current_user.projects
    @user = current_user
    @tasks = @user.tasks
  end


##################
  private

  def get_user
    @user = current_user if params[:id].nil?
    @user = User.find(params[:id]) unless params[:id].nil?
  end

end