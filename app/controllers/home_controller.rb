class HomeController < ApplicationController
  def index
    @events = Event.all.ordered
    @active_tab = params[:active_tab] || 'month'
  end
end
