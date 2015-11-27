class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.sort_by { |likes| likes.get_likes}
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)

    if @recipe.save
      flash[:success] = 'Your recipe is created successfully!'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = 'Your recipe is updated successfully!'
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def like
    @recipe = Recipe.find(params[:id])
    @like = Like.create(like: params[:like], recipe: @recipe, chef: Chef.first)
    if @like.valid?
      flash[:success] = 'Your selection was successful!'
    else
      flash[:danger] = 'You can like/dislike once!'
    end
    redirect_to :back
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end