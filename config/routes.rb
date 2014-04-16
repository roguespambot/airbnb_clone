AirbnbClone::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show] do
    resources :properties
  end
  root to: "homes#index"
end
