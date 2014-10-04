class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:new, :destroy]
  before_action :fetch_event, only: [:edit, :update, :show, :destroy, :log, :sum]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event created'
      redirect_to event_path @event
    else
      flash[:danger] = "Can't create Event due to some errors!"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = 'Event updated'
      redirect_to event_path @event
    else
      flash[:danger] = "Can't update Event due to some errors!"
      render action: :edit
    end
  end

  def show
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Event removed'
    redirect_to root_path
  end

  def log
  end

  def sum
    @user = User.find(params[:user_id])
  end


  private

  def fetch_event
    @event = Event.find(params[:id])
  end

  def event_params
    if current_user.admin?
      params.require(:event).permit(:name, :event_type_id, :due_date, :description, event_users_attributes: [:user_id, :id, :_destroy])
    else
      params.require(:event).permit(:name, :event_type_id, :due_date, :description)
    end
  end

  def authenticate_admin!
    unless current_user.admin?
      flash[:danger] = "Yuo don't have permissions to perform this action!"
      redirect_to root_path
    end
  end

end
