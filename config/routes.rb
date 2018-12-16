Rails.application.routes.draw do
  root 'posts#index'

  get :log_out, to: 'sessions#destroy'
  get :users, to: 'users#index'

  resources :users, except: :index do
    resources :posts, only: :index
    member do
      get 'comments'
    end
  end

  resources :posts
  resources :sessions, except: :index
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
