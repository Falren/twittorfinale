Rails.application.routes.draw do
  resources :users, except: %i[destroy create]
  resources :posts, except: %i[show]
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
