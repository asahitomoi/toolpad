Rails.application.routes.draw do
  get 'posts/selfhelp'
  get 'posts/introduction'
  get 'posts/top'
  get 'posts/index'
  get 'posts/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
