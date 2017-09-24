Rails.application.routes.draw do


  devise_for :employees, path: '', path_names: { sign_in: 'admin'}
  namespace :admin do
    resources :appointments
    resources :abilities
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
  namespace :user do
     root to: "home#index"
  end
    #root to: 'sites#index'
end
