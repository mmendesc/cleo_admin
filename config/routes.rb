Rails.application.routes.draw do
  resources :items
  resources :sales
  devise_for :employees, :path_prefix => 'usuario'
  resources :categories
  resources :services
  resources :manufacturers
  resources :products
  resources :clients
  resources :employees

  root to: "clients#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
