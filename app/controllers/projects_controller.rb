class ProjectsController < ApplicationController

  # before_filter :get_project, except: [:new]

  def index
    @projects = Project.recent
  end

  def show
    @project = Project.find(params[:id])
    # @task = @project.tasks.new(task: Task.new)
    @task = @project.tasks.new(params[:task])
    1.times do
      @task = @project.tasks.build
      1.times { @task.assignments.build }
    end
  end

  def new
    @current_user = current_user
    @project = @current_user.projects.new
  end

  def edit
    @project = Project.find([:id])

  end

  def create
    @user = current_user
    @project = @user.projects.create(params[:project])
    @project.user_id = @user

    if @project.save
      redirect_to(:back, notice: 'Project created successfully.')
    else
      redirect_to(:back, error: 'Something went wrong while creating the project.')
    end
  end

  def update
    @project = Project.update_attributes(params[:project])

    if @project.save
      redirect_to(projects_path, notice: 'Project updated successfully.')
    else
      redirect_to(:back, error: 'Something went wrong while updating the project.')
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to(projects_path, notice: "Project removed successfully.")
  end

  def remove_participation
    @project = Project.find(params[:project_id])
    user = User.find(params[:user])
    @project.users.delete(user)
    redirect_to(:back, notice: 'User removed successfully.')
  end

  #TASKS

  def add_task
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
    @task.user_id = current_user

    unless @task.users.empty?

      if @task.save
        redirect_to(@project, notice: 'Task created successfully.')
      else
        redirect_to(@project, error: 'Something went wrong while creating the task.')
      end

    else
      redirect_to(:back, alert: 'The task should be assign to someone.')
    end
  end

  private

  def get_project
    @project = current_user.projects.find(params[:id])
  end

end