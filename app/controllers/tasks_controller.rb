class TasksController < ApplicationController

  before_filter :get_project
  before_filter :get_task, except: [:new, :create]

  def show
  end

  def new
    @task = Task.new
    1.times { @task.assignments.build }
  end

  def create
    @task = @project.tasks.new(params[:task])
    @task.user_id = current_user

    if @task.save
      redirect_to(@project, notice: 'Task created successfully.')
    else
      redirect_to(:back, error: 'Something went wrong while creating the task.')
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to(@project, notice: 'Task updated successfully.')
    else
      redirect_to(:back, error: 'Somthing went wrong while updating the task.')
    end
  end


  def destroy
    @task.destroy
    redirect_to(:back, notice: 'The task was removed successfully.')
  end


  def done_task
    @task = @project.tasks.find(params[:id])
    @task.update_attributes(done: true)
    redirect_to(:back, notice: "Task #{@task.name} marked as done.")
  end

  def reopen_task
    @task = @project.tasks.find(params[:id])
    @task.update_attributes(done: false)
    redirect_to(:back, notice: "Task #{@task.name} reopened.")
  end

  def ask_for
    @questioning = @task.task_questions.new(params[:task_question])
    @questioning.type_questioning = params[:type_questioning].capitalize


    @questioning.message = 'Someone is asking the why of this task.' if @questioning.type_questioning == "Reason"
    @questioning.message = 'Someone is asking for more details for this task.' if @questioning.type_questioning == "Details"
    @questioning.message = 'Someone is asking for an expanded deadline for this task.' if @questioning.type_questioning == "Deadline"

    if @questioning.save
      redirect_to(:back, notice: 'Your questioning was sent.')
    end

  end

  # def delete_questioning
  #   @questioning = @task.task_questions.find(params[:task_question])
  #   @questioning.destroy
  #   redirect_to(:back, notice: 'The questioning was removed successfully.')
  # end
  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_task
    @task = @project.tasks.find(params[:id])
  end

end
