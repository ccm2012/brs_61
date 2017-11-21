Rails.application.routes.draw do
  root to: "pages#index"
  get "/search", to: "books#search"
  devise_for :users, path: "devise"
  resources :users
  resources :books do
    resource :reading_histories, only: %i(create update destroy)
  end
  resources :categories, only: :show
end
