Rails.application.routes.draw do
  resources :designers
  get 'cart' => "carts#show"

  get 'cart/edit' => "carts#edit"
  get 'wishlist' => "favorite_lists#show"

  resources :unit_images
  resources :units
  resources :items

  root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    resources :items, only: [] do
      collection do
        get :index
      end
      member do
        get :show
      end
    end

    resources :carts, only: [] do
      collection do
        get :show
      end
    end

    resources :cart_items, only: [] do
      collection do
        post :create
      end
    end

    resources :favorites, only: [] do
      collection do
        post :create
      end
    end

    resources :favorite_lists, only: [] do
      collection do
        get :show
      end
    end
  end
end
