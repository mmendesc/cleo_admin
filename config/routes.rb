Rails.application.routes.draw do

  devise_for :employees, path: '', path_names: { sign_in: 'admin'}
  namespace :admin do
    resources :appointments
    resources :items
    resources :sales
    resources :saloons
    resources :categories
    resources :services
    resources :manufacturers
    resources :products
    resources :clients
    resources :employees

    get '/calendar' => 'pages#calendar', as: 'calendar'
    root to: "clients#index"
  end

  root to: 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
