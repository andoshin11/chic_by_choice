Rails.application.routes.draw do
  get 'cart/show'

  get 'cart/edit'

  resources :unit_images
  resources :units
  resources :items

  root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    resources :items, only: [] do
      collection do
      end
      member do
        get :show
      end
    end

    resources :cart_items, only: [] do
      collection do
        post :create
      end
    end
  end
end
