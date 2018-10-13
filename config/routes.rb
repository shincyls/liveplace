Rails.application.routes.draw do

  root 'statics#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    member do
      get :place
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
