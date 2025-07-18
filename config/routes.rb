Rails.application.routes.draw do
 
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  devise_for :admins
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
