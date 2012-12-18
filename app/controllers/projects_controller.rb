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
    @project = Project.new(params[:project])
    @project.user_id = current_user

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
    current_user.revoke('project_owner', @project)
    @project.destroy
    redirect_to(projects_path, notice: "Project removed successfully.")
  end


  #TASKS

  def add_task
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
    @task.user_id = current_user
    # assignment = @task.assignments.new(params[:assignments])

    if @task.save
      redirect_to(@project, notice: 'Task created successfully.')
    else
      redirect_to(@project, error: 'Something went wrong while creating the task.')
    end
  end

end