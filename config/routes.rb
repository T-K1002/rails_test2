Rails.application.routes.draw do
  post "reservations/confirm", to: "reservations#confirm"
  devise_for :users
  root to: "home#index"
 

  resources :rooms do
    collection do
      get "search"
      get "own"
   end
  end

  resources :users do
    member do
      get "account"
   end
  end

  resources :reservations

  resources :rooms do
    resources :reservations
  end

  
end
