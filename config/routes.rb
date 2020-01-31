Rails.application.routes.draw do
  resources :phones
  resources :emails
  resources :addresses
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
