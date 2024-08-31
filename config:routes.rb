# config/routes.rb
Rails.application.routes.draw do
  post 'login', to: 'employees#login'
  resources :logs, only: [:create]
end
