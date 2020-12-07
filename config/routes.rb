Rails.application.routes.draw do
  devise_for :users
  root to: "expendables#index"
  resources :expendables

end
