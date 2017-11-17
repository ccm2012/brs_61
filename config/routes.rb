Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users, path: "devise"
  resources :users
  resources :books
end
