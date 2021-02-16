Rails.application.routes.draw do
  devise_for :users
    # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :companies, only: [ :index, :show, :update ] do
        resources :products, only: [:index, :show, :update ]
      end
    end
  end
end
