Rails.application.routes.draw do
  
  get 'pages/home'

  resources :articles do
    resources :comments
  end
 
  root 'pages#home'
  get '/home' , to: 'pages#home'

  resources :recipes

 
end
