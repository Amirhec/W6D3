Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users

  # get "/users", to: "users#index"
  # get "/users/new", to: "users#new", as: "new_user"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # get "/users/:id", to: "users#show", as: "user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  resources :users, only: [:create,:destroy,:show, :index, :update]
  resources :artworks, only: [:create,:destroy,:show, :update]
  # resources :artworks, only:[:create,:destroy,:show, :index, :update]
  resources :artwork_shares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: [:index] 
  end

  
  resources :comments, only: [:create, :destroy, :index]
end
