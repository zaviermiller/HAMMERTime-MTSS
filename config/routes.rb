Rails.application.routes.draw do
  resources :requests
  resources :rooms do
    member do
      patch :signup
      patch :leave
    end
  end
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  get 'main/index'
  get 'main/home'
  patch 'main/next'
  patch 'main/prev'
  patch '/absent/:id', to: "main#absent", as: "absent"
  patch '/add-friend/:id', to: "main#addfriend", as: "add"


  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
