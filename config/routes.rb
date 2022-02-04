Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  root "pages#home"

  devise_scope :user do
    get "users",to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get "user/:id", to: "users#show" , as: "user"
end
