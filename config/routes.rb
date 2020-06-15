Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users

  resources :heros

  #resources :adventures
  get "login" => "sessions#new"
  get "/auth/:provider/callback" => "sessions#create"

  resources :experiences

  post '/adventures', to: 'adventures#create'
end
