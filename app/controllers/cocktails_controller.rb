class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.all
    @doses = @doses.includes(:ingredient).where(cocktail_id: params[:id])
    @dose = Dose.new
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
