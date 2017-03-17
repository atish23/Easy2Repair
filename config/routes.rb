Rails.application.routes.draw do
  resources :contactus

  resources :bills

  resources :assignments

  resources :issues 

  resources :plans
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'home#index'
  get 'services/:id' => 'home#show', as: 'service'
  get 'my_plans' => 'issues#my_plans', as: 'my_plans'

end
