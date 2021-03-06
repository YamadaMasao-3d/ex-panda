Rails.application.routes.draw do
  devise_for :users
  root to: "expendables#index"
  resources :expendables
  resources :wants
  resources :favorites 
  put "favorites/:id/day_update", to: "favorites#day_update"
  put "expendables/:id/day_update", to: "expendables#day_update"
end
