class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_chef, only: [:edit, :update]
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end

  def show
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = 'Your recipe is created successfully!'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Your recipe is updated successfully!'
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def like
    @like = Like.create(like: params[:like], recipe: @recipe, chef: current_user)
    if @like.valid?
      flash[:success] = 'Your selection was successful!'
    else
      flash[:danger] = 'You can like/dislike once!'
    end
    redirect_to :back
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [])
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_chef
      if @recipe.chef != current_user
        flash[:danger] = "You can edit your recipes only!"
        redirect_to root_path
      end
    end
    
end