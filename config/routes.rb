Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#show"
  resources :users do 
    put :request_demo, on: :member
    put :accept_demo, on: :member
  end

  resources :tests do
    post :execute, on: :member
    get :configure, on: :collection
  end

  resources :app_configs do
    put :connect, on: :collection
    put :disconnect, on: :collection
  end
end
