class TeamController < ApplicationController
  before_filter :authenticate_user!
  before_action :fetch_user, only: [:show, :events, :activities]

  def index
    @users = User.all.ordered
  end

  def show
    # todo add couter_cache for user events
  end

  def events
    @active_tab = params[:active_tab] || 'agenda'
  end

  def activities
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end
end
