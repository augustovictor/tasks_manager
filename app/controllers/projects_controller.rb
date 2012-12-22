class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.new(params[:task])
    1.times do
      @task = @project.tasks.build
      1.times { @task.assignments.build }
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find([:id])

  end

  def create
    @user = current_user
    @project = @user.projects.new(params[:project])
    @project.user_id = @user

    if @project.save
      redirect_to(projects_path, notice: 'Project created successfully.')
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

end