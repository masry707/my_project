class SessionsController < ApplicationController
    
   def new
   
   end
   
   def create
       chef = Chef.find_by_email(params[:email])
       if chef and chef.authenticate(params[:password])
          session[:chef_id] = chef.id
          flash[:success] = "Welcome #{chef.chef_name}, your are logged in successfully!"
          redirect_to recipes_path 
       else
           flash[:danger] = "Wrong email address or password!"
           render 'new'
       end
   end
   
   def destroy
       session[:chef_id] = nil
       flash[:success] = "You logged out successfully!"
       redirect_to root_path
   end
end