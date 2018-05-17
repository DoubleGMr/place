Rails.application.routes.draw do

  root 'static_pages#index'
  get '/about', to:'static_pages#about'
  get '/admin', to:'admin/sessions#new'
  post '/admin',to:'admin/sessions#create'
  delete '/logout',to:'admin/sessions#destroy'

  resources :posts,only:[:show]
  resources :messages, only:[:create]
  resources :posts, only:[:show]

  namespace :admin do
  	resources :posts, only:[:index,:create,:update,:destroy,:show]
    resources :messages, only:[:index,:destroy]
    resources :abouts,only:[:index,:create,:update]
    resources :sessions,only:[:new,:create,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
