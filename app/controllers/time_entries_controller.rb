class TimeEntriesController < ApplicationController
  before_action :get_time_entry,  only: [:show, :edit, :update]

  before_action :check_if_logged_in, only: [:edit, :update, :new, :destroy]

  before_action :check_if_admin, only: [:index]


  def get_time_entry
    @time_entry = TimeEntry.find params["id"]

    # @projects = Project.where
  end

  def index
    # @time_entries = TimeEntry.all

    # get all time entries, grouped by project:
    # this returns a hash with THE WHOLE PROJECT OBJECT as the KEY
    # and an ARRAY OF TIME ENTRY OBJECTS (for that project) as the value
    # (use '.group_by(&:project_id)' to use use the ID as a key )
    # @entries = TimeEntry.where(user: @current_user).group_by(&:project)

    check_if_admin
    @entries = TimeEntry.all.group_by(&:project)

  end

  def show
  end

  def new
    @time_entry = TimeEntry.new
    @user = @current_user
  end

  def create

    te = @current_user.time_entries.new(time_entry_params)

    Time.zone = "Australia/Sydney"
    s = Time.zone.parse "#{params[:time_entry]["start_time(1i)"]}-#{params[:time_entry]["start_time(2i)"]}-#{params[:time_entry]["start_time(3i)"]} #{params[:time_entry]["start_time(4i)"]}:#{params[:time_entry]["start_time(5i)"]}"

    e = Time.zone.parse "#{params[:time_entry]["end_time(1i)"]}-#{params[:time_entry]["end_time(2i)"]}-#{params[:time_entry]["end_time(3i)"]} #{params[:time_entry]["end_time(4i)"]}:#{params[:time_entry]["end_time(5i)"]}"

    # 
    # s = Time.new(
    #   params[:time_entry]["start_time(1i)"],
    #   params[:time_entry]["start_time(2i)"],
    #   params[:time_entry]["start_time(3i)"],
    #   params[:time_entry]["start_time(4i)"],
    #   params[:time_entry]["start_time(5i)"]
    # )
    #
    # e = Time.new(
    #   params[:time_entry]["end_time(1i)"],
    #   params[:time_entry]["end_time(2i)"],
    #   params[:time_entry]["end_time(3i)"],
    #   params[:time_entry]["end_time(4i)"],
    #   params[:time_entry]["end_time(5i)"]
    # )

    te.start_time = s
    te.end_time = e

    puts "="*50
    puts "start_time: ", s
    puts "end_time: ", e

    puts "te object:"
    puts te.start_time.to_s
    puts te.end_time.to_s

    if te.save

      puts "AFTER SAVE==================================="
      puts TimeEntry.last.start_time.to_s
      puts TimeEntry.last.end_time.to_s


      redirect_to new_time_entry_path
    else
      render :new
    end

    # te.calculate_time! unless te.nil?
    # te.calculate_amount! unless te.nil?
    # te.save
  end

  def edit
  end

  def update

    te = TimeEntry.find params[:id]

    te.start_time = Time.new(
      params[:time_entry]["start_time(1i)"],
      params[:time_entry]["start_time(2i)"],
      params[:time_entry]["start_time(3i)"],
      params[:time_entry]["start_time(4i)"],
      params[:time_entry]["start_time(5i)"]
    )

    te.end_time = Time.new(
      params[:time_entry]["end_time(1i)"],
      params[:time_entry]["end_time(2i)"],
      params[:time_entry]["end_time(3i)"],
      params[:time_entry]["end_time(4i)"],
      params[:time_entry]["end_time(5i)"]
    )

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
    params.require(:time_entry).permit(:user_id, :project_id)
  end
end
