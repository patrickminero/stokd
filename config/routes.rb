Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users
      resources :users, only: [:index, :show]
      resources :companies, only: [ :index, :show, :update ] do
        resources :products, only: [:index, :show, :update ]
      end
    end
  end
end
