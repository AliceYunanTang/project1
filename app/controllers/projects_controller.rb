class ProjectsController < ApplicationController
  before_action :get_project,  only: [:show, :edit, :update]


  def get_project
    @project = Project.find params["id"]
    @users = @project.users
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def create
    # raise 'hell'
    @project = Project.create project_params

    # redirect_to "/projects/#{ @project.id }"
    redirect_to project_path(@project)
  end

  def edit


  end

  def update
    @project.update project_params
    redirect_to project_path(params["id"])
  end

  def index
    @projects = Project.all
  end

  def show

  end

  def destroy

  end

  private
  def project_params
    params.require(:project).permit(:name, :user_id, :image, :description, :location)
  end
end
