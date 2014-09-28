class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :event_type_id, :due_date, :description))
    if @event.save
      @event.assign_users_by_ids(params.require(:users).keys) if params[:users]
      flash[:notice] = 'Event created'
      redirect_to root_path
    else
      flash[:danger] = "Can't create Event due to some errors!"
      render action: :new
    end
  end

end
