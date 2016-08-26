 class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)  
    redirect_to project_path(@task.project)
  end

   def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @project = @task.project
    #redirect_to project_path(@task.project)
  end
  
  def destroy
      @task = Task.find(params[:id])
      @task.destroy
      respond_to do |format|
         format.js
      end
      
      #redirect_to project_path(@task.project)
    end

    def complete
      @task = Task.find(params[:id])
      @task.complete!
      #redirect_to project_path(@task.project)
    end
  private

  def task_params
    params.require(:task).permit(:title, :priority, :completed)
  end
  end
