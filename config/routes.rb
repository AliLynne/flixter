Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  get 'team', to: 'static_pages#team'
  get 'careers', to: 'static_pages#careers'
  get 'privacy', to: 'static_pages#privacy'
  resources :courses, only: [:index, :show, :destroy] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  namespace :instructor do
    resources :sections, only: [:update]
    resources :lessons, only: [:update]
    resources :sections, only: [] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:create]
    end
  end
end
