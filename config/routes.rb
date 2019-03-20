Rails.application.routes.draw do
  root 'posts#top'
  get 'posts/selfhelp'
  get 'posts/introduction'
  get 'posts/top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resource :comments
    resource :favorites, only: [:create, :destroy]
  end

  resources :recipes
  resources :materials
  resources :users do
    # resources :favorites do
    #   post "add", to: "favorite#create"
    #end
    get 'information', to:'users#information'
    get 'post', to:'users#post'
    get 'favorite', to:'users#favorite'
  end

  get 'search', to: 'posts#search', as: :search



end
