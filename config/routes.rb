Rails.application.routes.draw do

  root 'statics#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    member do
      get :place
      patch :sethome
    end
  end

  get 'home', to: 'users#home', as: :home

  get 'states/:country', to: 'users#states'
  get 'cities/:state', to: 'users#cities'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
