Rails.application.routes.draw do
  root 'lists#index'

  resources :tasks
  resources :lists


end
