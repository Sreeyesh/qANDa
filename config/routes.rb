Rails.application.routes.draw do
  match '/signin' => 'account#sign_in', via: [:get, :post]
  match '/signup' => 'account#sign_up', via: [:get, :post]

  get '/signout' => 'account#sign_out'
  get '/login' => 'account#index'
  get '/user_details/:id' => 'account#show'

  resources :answers
  resources :questions
  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
