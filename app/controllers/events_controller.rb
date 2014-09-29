class EventsController < ApplicationController
  before_filter :authenticate_user!

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
      redirect_to root_path
    else
      flash[:danger] = "Can't create Event due to some errors!"
      render action: :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:notice] = 'Event updated'
      redirect_to edit_event_path @event
    else
      flash[:danger] = "Can't update Event due to some errors!"
      render action: :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :event_type_id, :due_date, :description, event_users_attributes: [:user_id, :id, :_destroy])
  end

end
