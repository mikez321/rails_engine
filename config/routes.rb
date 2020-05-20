Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: "item_search#show"
        get '/find_all', to: "item_search#index"
      end

      namespace :merchants do
        get '/find', to: "merchant_search#show"
        get '/find_all', to: "merchant_search#index"
      end

      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :merchant, only: [:index], to: 'merchants#show'
      end

      resources :merchants, only: [:index, :show, :create, :update, :destroy] do
        resources :items, only: [:index]
      end

    end
  end
end
