Rails.application.routes.draw do
  resources :users do
    get :toggle_status, on: :member
    get :remove, on: :member
  end

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
