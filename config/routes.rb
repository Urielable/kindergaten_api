Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :activities, only: :index
      resources :babies, only: :index
      resources :babies do
        resources :activity_logs, only: :show
      end
      resources :activity_logs, only: [:create, :update]
    end
  end
  
  get '*unmatched_route', :to => 'errors#raise_not_found'
  post '*unmatched_route', :to => 'errors#raise_not_found'
  patch '*unmatched_route', :to => 'errors#raise_not_found'
  delete '*unmatched_route', :to => 'errors#raise_not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
