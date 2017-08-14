class TimeEntriesController < ApplicationController
  before_action :get_time_entry,  only: [:show, :edit, :update]

  before_action :check_if_logged_in

  before_action :check_if_admin, only: [:index]


  def get_time_entry
    @time_entry = TimeEntry.find params["id"]
  end

  def index
    # @time_entries = TimeEntry.all

    # get all time entries, grouped by project:
    # this returns a hash with THE WHOLE PROJECT OBJECT as the KEY
    # and an ARRAY OF TIME ENTRY OBJECTS (for that project) as the value
    # (use '.group_by(&:project_id)' to use use the ID as a key )
    # @entries = TimeEntry.where(user: @current_user).group_by(&:project)

    # check_if_admin
    if @current_user.is_admin
      @time_entries = TimeEntry.all
    else
      @time_entries = @current_user.time_entries
    end

  end

  def show
  end

  def new
    @time_entry = TimeEntry.new
    @user = @current_user
  end

  def create

    te = @current_user.time_entries.new(time_entry_params)

    s = params[:time_entry][:start_time].to_time
    e = params[:time_entry][:end_time].to_time

    te.start_time = s
    te.end_time = e

    if te.save
      redirect_to new_time_entry_path
    else
      render :new
    end

  end

  def edit

  end

  def update

    te = TimeEntry.find params[:id]
    te.start_time = params[:time_entry][:start_time].to_time
    te.end_time = params[:time_entry][:end_time].to_time

    if te.update(time_entry_params)
      redirect_to new_time_entry_path
    else
      render :new
    end

  end

  def destroy
    TimeEntry.find( params["id"]).destroy
    redirect_to new_time_entry_path
  end

  private
  def time_entry_params
    params.require(:time_entry).permit(:user_id, :project_id, :start_time, :end_time, :time, :amount)
  end
end
