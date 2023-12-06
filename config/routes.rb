Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create] # Add more actions as needed
      resources :likes, only: [:new, :create] # Add more actions as needed
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
