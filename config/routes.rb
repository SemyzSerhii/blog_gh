Rails.application.routes.draw do
  root 'posts#index'

  get :log_out, to: 'sessions#destroy'

  resources :posts
  resources :users, except: :index
  resources :sessions, except: :index
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
