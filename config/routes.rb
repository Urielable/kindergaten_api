Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :activity_logs, only: [:index]
      end
      namespace :catalogs do
        resources :babies, only: [:index]
        resources :assistants, only: [:index]
        resources :activity_status, only: [:index]
      end
      resources :users
      resources :activities, only: :index
      resources :babies, only: :index
      resources :babies do
        resources :activity_logs, only: [:index, :update]
      end
      resources :activity_logs, only: [:create]
    end
  end
  
  get '*unmatched_route', :to => 'errors#raise_not_found'
  post '*unmatched_route', :to => 'errors#raise_not_found'
  patch '*unmatched_route', :to => 'errors#raise_not_found'
  delete '*unmatched_route', :to => 'errors#raise_not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
