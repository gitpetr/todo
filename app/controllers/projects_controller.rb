class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @projects = Project.all.order("created_at DESC")
    if user_signed_in?
       @projects = Project.where(:user_id => current_user.id).order("created_at DESC")
    end
  end

  def show
    @task = @project.tasks.build
  end

  def new
    #@project = Project.new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    #@project = Project.new(project_params)
    @project = current_user.projects.build project_params
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Новый проект создан.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Проект обновлен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Проект удален.' }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:number, :name)
    end
end
