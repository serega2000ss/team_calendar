class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :fetch_event, only: [:edit, :update, :show, :log]

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

  def log
  end


  private

  def fetch_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_type_id, :due_date, :description, event_users_attributes: [:user_id, :id, :_destroy])
  end

end
