Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts do
    get "search"
  end
end
