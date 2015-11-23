Rails.application.routes.draw do
  
  get 'pages/home'

  resources :articles do
    resources :comments
  end
 
  root 'welcome#index'

  get '/home' , to: 'pages#home'

 
end
