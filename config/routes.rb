Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :events do
    member do
      get 'log'
    end
  end

  resources :team, only: [:index, :show] do
    member do
      get 'events'
      get 'activities'
    end
  end

  #custom routes
  get '/(:active_tab)' => 'home#index', as: :homepage
  get '/team/:id/events/(:active_tab)' => 'team#events', as: :user_events
  get '/events/:id/users/:user_id/sum' => 'events#sum', as: :event_user_sum
end
