Rails.application.routes.draw do
  resources :users
  resources :projects
  resources :invoices
  get "signup" => "users#new"
  resource :session, only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
