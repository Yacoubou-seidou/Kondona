Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    get 'new', to: 'home#new', as: :new_home
    resources :groups do
      resources :depenses
    end
  end
end
