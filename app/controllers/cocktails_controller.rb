class CocktailsController < ApplicationController

  def index
    if params[:query]
      @query = params[:query]
      @cocktails = Cocktail.select("cocktails.*")
                            .where("lower(ingredients.name) LIKE '%#{@query}%'")
                           .joins(ingredients: :doses)
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @dose = Dose.new
    @ingredients = Ingredient.all
    @reviews = @cocktail.reviews
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
