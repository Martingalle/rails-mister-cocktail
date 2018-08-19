class CocktailsController < ApplicationController

  def index
    @cocktail = Cocktail.new
    @doses = Dose.all
    @ingredients = Ingredient.all
    if params[:ingredient]
      return redirect_to cocktails_path unless params[:ingredient].in?(Cocktail::INGREDIENTS)
      @ingredient = @ingredients.where(name: params[:ingredient])
      @doses = @doses.where(ingredient_id: @ingredient)
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.all
    end
  end

  def game
  end

  def best
    @cocktails = Cocktail.all
    @reviews = Review.all
    @reviews = @reviews.where(:rating => [5])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @reviews = Review.all
    @reviews = @reviews.where(cocktail_id: params[:id])
    @doses = Dose.all
    @doses = @doses.includes(:ingredient).where(cocktail_id: params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save!
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktails = Cocktail.find(params[:id])
    @cocktails.destroy
    redirect_to cocktails_path
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
