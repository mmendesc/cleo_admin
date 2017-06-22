Rails.application.routes.draw do
  resources :categories
  resources :services
  resources :manufacturers
  resources :products
  resources :clients

  root to: "clients#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
