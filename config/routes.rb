Rails.application.routes.draw do
  root "users#new"
  resources :users, except: [:new]
end
