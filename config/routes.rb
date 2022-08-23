Rails.application.routes.draw do
    
  get 'admin/users'
  devise_for :users

  root to: "home#index"

  get '/' => 'home#index'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'
  get 'users' => 'admin#users'
  get 'search' => 'articles#search'

  post 'set_admin/:id' => 'admin#set_admin'

  resource :contacts, only: [:new, :create], path_names: { new: '' }
  resources :articles do
    resources :comments, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
