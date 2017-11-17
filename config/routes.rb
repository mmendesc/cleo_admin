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

    #show graphs
    get '/top_report' => 'reports#top_report', as: 'top_report'
    get '/revenue' => 'reports#revenue', as: 'revenue'
    get '/day_revenue' => 'reports#day_revenue', as: 'day_revenue'
    get '/day_product_revenue' => 'reports#day_product_revenue', as: 'day_product_revenue'
    get '/product_revenue' => 'reports#product_revenue', as: 'product_revenue'

    ## returns json
    get '/top_ten' => 'reports#top_ten', as: 'top_ten_clients'
    get '/total_revenue' => 'reports#total_revenue', as: 'total_revenue'
    get '/revenue_day' => 'reports#revenue_by_day', as: 'revenue_by_day'
    get '/revenue_day_product' => 'reports#revenue_by_day_and_product', as: 'revenue_by_day_and_product'
    get '/revenue_by_product' => 'reports#revenue_by_product', as: 'revenue_by_product'


    get '/calendar' => 'pages#calendar', as: 'calendar'
    root to: "clients#index"
  end


  root to: 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
