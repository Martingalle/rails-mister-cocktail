Rails.application.routes.draw do
  get 'best', to: "cocktails#best", as: :best
  get 'game', to: "cocktails#game", as: :game
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

   resources :doses, only: [:destroy]
end
