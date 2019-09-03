Rails.application.routes.draw do
  resources :photos  do 
    collection do 
      post  :confirm
    end
  end
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root "users#new"
  resources :users, except: [:new]
end
