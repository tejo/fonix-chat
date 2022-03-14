# frozen_string_literal: true

Rails.application.routes.draw do
  get 'messages/index'
  post 'messages/create'
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  devise_for :installs
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
    get 'users/sign_out', to: 'messages#log_out'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root 'messages#index'
end
