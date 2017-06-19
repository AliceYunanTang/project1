class TimeEntriesController < ApplicationController
  before_action :get_time_entry

  def get_time_entry
    @time = TimeEntry.find params["id"]
    # @projects = Project.where
  end

  

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def time_entry_params
    params.require(:time_entry).permit(:user_id, :project_id, :start_time, :end_time)
  end
end
