Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals
  resources :user_comments, only: [:create]
  resources :goal_comments, only: [:create]
end
