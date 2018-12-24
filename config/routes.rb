Rails.application.routes.draw do
  root 'posts#index'

  resources :users do
    resources :posts, only: :index do
      resources :comments
    end
  end
  resources :password_resets
  resources :posts
  resources :sessions, except: %i[destroy index]
  get :log_out, to: 'sessions#destroy'
  get :draft, to: 'posts#draft'
end
