Rails.application.routes.draw do
  root to: "api/users#root"

  namespace :api do
    resources :users
  end

end

