class ProjectsController < ApplicationController
  before_action :get_project,  only: [:show, :edit, :update, :destroy]
  before_action :check_if_logged_in

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    @all_users = User.all
    @users = []
  end

  def create
    @project = Project.create project_params

    users = User.where(id: params[:add_user][:id] )
    @project.users << users

    redirect_to project_path(@project)
  end

  def edit
  end

  def update
    # assign users to project
    unless ( params[:add_user] ).blank?
      add_users = User.where(id: params[:add_user][:id] )
      @project.users << add_users
    end

    # remove users from project
    unless ( params[:remove_user] ).blank?
      remove_users = User.where(id: params[:remove_user][:id])
      @project.users.delete(remove_users)
    end

    # update project and redirect to show detail page if successful
    if @project.update(project_params)
      redirect_to project_path(params["id"])
    else
      render :edit
    end

  end

  def destroy
    # remove users from the project before deletion
    @project.users.delete(@users) unless @users.blank?

    # delete project
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :user_id, :image, :description, :location)
  end

  def get_project
    @project = Project.find params["id"]
    @users = @project.users
    @all_users = User.all
  end

end
