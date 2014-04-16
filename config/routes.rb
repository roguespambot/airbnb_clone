AirbnbClone::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show] do
    resources :properties, :except => [:index, :show]
  end
  resources :properties, :only => [:index, :show]
  root to: "homes#index"
end
