Rails.application.routes.draw do

  root 'statics#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    member do
      get :place
      patch :sethome
    end
  end

  resources :neighborhood_posts, only: [:show, :edit, :create, :update, :destroy]
  resources :neighborhood_replies, only: [:edit, :create, :update, :destroy]

  get 'states/:country', to: 'users#states'
  get 'cities/:state', to: 'users#cities'

  #get 'home', to: 'users#home', as: :home

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
