class TaskQuestionsController < ApplicationController

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @question = @task.task_questions.find(params[:id])

    @question.destroy

    redirect_to(:back, notice: 'The questioning was removed successfully.')
  end

end