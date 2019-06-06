Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :heros, only: [:index, :new]
  end
  resources :heros, except: [:index, :new] do
    resources :adventures, only: [:show]
  end
  resources :adventures, except: [:show]

  resources :experiences
  post '/adventures', to: 'adventures#create'
end
