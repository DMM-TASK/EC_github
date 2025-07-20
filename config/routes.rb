Rails.application.routes.draw do
  devise_for :admins
 
  devise_for :customers

  root to: "homes#top"
  get "/about" => "homes#about"
  get "customers/my_page/:id" => "customers#show", as: 'customers_my_page'
  get "customers/information/:id" => "customers#edit",as: 'customers_information'
  patch "customers/my_page/:id" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe"
  patch "/customers/withdraw" => "customers#withdraw"
  
  # admin 側ルーティング
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
