Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/help',to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get "/signup", to: "users#new"
  resources :users
  get "/login" => "sessions#new"
  delete "/logout" => "sessions#destroy"
  post "/login" => "sessions#create"
  resources :account_activations, only: [:edit]

end