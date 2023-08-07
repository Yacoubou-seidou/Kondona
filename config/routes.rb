Rails.application.routes.draw do
    root 'home#index'
  devise_for :users

  authenticated :user do
    resources :depenses
    resources :groups
  end
end
