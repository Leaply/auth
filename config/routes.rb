Rails.application.routes.draw do
  # Devise for user management
  devise_for :users

  root 'home#index'
end
