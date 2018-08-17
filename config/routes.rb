Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  # get 'doses/index'
  # get 'doses/show'
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/destroy'
  resources :cocktails, only: [:new, :create, :destroy] do
    resources :doses, only: [:index, :show, :new, :create]
    resources :reviews, only: [:new, :create]
  end

   resources :doses, only: [:destroy]
end
