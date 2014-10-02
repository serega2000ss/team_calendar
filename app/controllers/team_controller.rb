class TeamController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all.ordered
  end

  def show
    # todo add couter_cache for user events
    @user = User.find(params[:id])
  end

  def events
    @user = User.find(params[:id])
    @active_tab = params[:active_tab] || 'agenda'
  end

end
