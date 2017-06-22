class ProjectsController < ApplicationController
  before_action :get_project,  only: [:show, :edit, :update]


  def get_project
    @project = Project.find params["id"]
    @users = @project.users
    @all_users = User.all
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def create
    # raise 'hell'
    @project = Project.create project_params

    users = User.where(id: params[:user][:id] )
    @project.users << users

    # @project.users << params[:new_user_id] unless params[:new_user_id].nil?
    # @users << params[:new_user_id] unless params[:new_user_id].nil?
    # redirect_to "/projects/#{ @project.id }"

    redirect_to project_path(@project)
  end

  def edit


  end

  def update


    users = User.where(id: params[:user][:id] )
    # raise 'hell'

    @project.users << users

    @project.update project_params

    # @users.update params[:new_user_id] unless params[:new_user_id].nil?
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
