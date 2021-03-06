Rails.application.routes.draw do
  resources :phones
  # resources :emails
  resources :emails
  resources :addresses
  # resources :people
  resources :people do
    resources :emails, only: [:new, :create]
    resources :phones, only: [:new, :create]
    resources :addresses, only: [:new, :create]
  end

  root 'people#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
