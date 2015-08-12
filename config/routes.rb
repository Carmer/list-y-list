Rails.application.routes.draw do
  root 'lists#index'

  resources :lists
  resources :tasks

  put "/task/:id/update", to: "tasks#js_update"
end
