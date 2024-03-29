Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # devise_for :users
  # resources :users
  resources :skills
  resources :employees
  resources :dominates
  resources :items
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :skills
      resources :employees
      resources :dominates
      resources :items
    end
  end
end
