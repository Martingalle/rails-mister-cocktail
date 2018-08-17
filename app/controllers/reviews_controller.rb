class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[cocktail_id])
    @review.cocktail = @cocktail
    redirect_to cocktail_path(@cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
