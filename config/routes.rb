Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :heros, only: [:index, :new]
  end

  resources :heros, except: [:index, :new]

  #resources :adventures
  resources :users do
    resources :experiences, only: [:index, :new]
  end

  resources :experiences, except: [:index, :new]

  post '/adventures', to: 'adventures#create'
end
