Rails.application.routes.draw do
  devise_for :customers
  resources :items, only:[:show, :index]
  root to: "homes#top"
  get "/about" => "homes#about"
  
  get "customers/my_page/:id" => "customers#show", as: 'customer'
  get "customers/information/:id" => "customers#edit",as: 'edit_customer'
  patch "customers/my_page/:id" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe", as: 'unsubscribe_customer'
  patch "/customers/withdraw" => "customers#withdraw", as: 'withdraw_customer'
  
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
