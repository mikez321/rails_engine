Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: "item_search#show"
        get '/find_all', to: "item_search#index"
        get '/:item_id/merchant', to: "item_merchant#show"
      end

      namespace :merchants do
        get '/find', to: "merchant_search#show"
        get '/find_all', to: "merchant_search#index"
        get '/most_items', to: "most_items#index"
        get '/most_revenue', to: "most_revenue#index"
        get '/:merchant_id/items', to: "merchant_items#index"
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
