Rails.application.routes.draw do
  resources :requests
  resources :rooms do
    member do
      patch :signup
      patch :leave
    end
  end
  devise_for :users
  get 'main/index'
  get 'main/home'


  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
