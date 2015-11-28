class ChefsController < ApplicationController
    before_action :set_chef, only: [:edit, :update, :show]
    before_action :require_same_chef, only: [:edit, :update]
    
    
    def index
       @chefs = Chef.paginate(page: params[:page], per_page: 3) 
    end
    
    def show
        @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
    end
   
   def new
       @chef = Chef.new
   end
   
   def create
       @chef = Chef.new(chef_params)
       
       if @chef.save
          session[:chef_id] = @chef.id
          flash[:success] = "Your Account is created successfully!"
          redirect_to recipes_path
      else
          render 'new'
       end
   end
   
   def edit
       
   end
   
   def update
       if @chef.update(chef_params)
           flash[:success] = "Your Account is updated successfully!"
           redirect_to chef_path(@chef)
       else
          render 'edit' 
       end
   end
   
   private
    def chef_params
       params.require(:chef).permit(:chef_name, :email, :password) 
    end
    
    def set_chef
      @chef = Chef.find(params[:id])
    end
    
    def require_same_chef
       if @chef != current_user
           flash[:danger] = "You can edit your profile only!"
           redirect_to root_path
       end 
    end
end