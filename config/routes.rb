AirbnbClone::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show] do
    resources :properties, :except => [:index, :show]
  end
  resources :properties, :only => [:index, :show] do
    resources :rentals, :except => [:index]
  end
  resources :rentals, :only => [:index] do
    resources :ratings
  end

  resources :homes

  root to: "homes#index"
end
