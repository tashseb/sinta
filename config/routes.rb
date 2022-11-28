Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/create'
  get 'roles/new'
  get 'roles/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :roles, exclude: %i[edit destroy] do
    resources :candidates, only: %i[index create new]
    resources :stages, only: :create
  end
  resources :stages, only: %i[edit update] do
    resources :stage_interviewers, only: %i[new create]
    resources :questions, only: :create
  end

  resources :candidates, only: %i[show update]
  resources :interviews, only: %i[index create new show edit]
end
