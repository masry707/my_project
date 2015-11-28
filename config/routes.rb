Rails.application.routes.draw do
  
  get 'pages/home'

  resources :articles do
    resources :comments
  end
 
  root 'pages#home'
  get '/home' , to: 'pages#home'

  resources :recipes do
    member do
      post 'like'
    end
  end
  
  resources :chefs, except: :new
  get '/register', to: 'chefs#new'

 
end
