Rails.application.routes.draw do
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :create] # Add more actions as needed
      resources :likes, only: [:create] # Add more actions as needed
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
