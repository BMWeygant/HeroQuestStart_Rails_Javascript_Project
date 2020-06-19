Rails.application.routes.draw do
  devise_for :users, controllers: {
    #sessions: 'users/sessions',
    #registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth'
  }  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users

  resources :heros

  get "login" => "sessions#new"
  get "/auth/heroku/callback" => "sessions#create"
  #resources :adventures

  resources :experiences

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  #   get 'sign_up', to: 'devise/registrations#new'
  #   get 'forgot_password', to: 'devise/passwords#new'
  #   get 'reset_password', to: 'devise/passwords#edit'
  # end

  post '/adventures', to: 'adventures#create'
end

# HeroQuestStart::Application.routes.draw do
#   get "login" => "sessions#new"
#   get "/auth/#{:provider}/callback" => "sessions#create"
# end
