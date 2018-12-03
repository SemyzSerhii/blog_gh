Rails.application.routes.draw do
  root 'posts#index'

  get :log_out, to: 'sessions#destroy'

  resource :posts
  resources :users, except: :index
  resources :sessions, except: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
