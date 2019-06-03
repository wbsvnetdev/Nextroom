class ReviewsController < ApplicationController

  def create
    @boxe = Boxe.find(params[:box_id])
    @review = Review.new(review_params)
    @review.boxe = @boxe
    if @review.save
      respond_to do |format|
      format.html { redirect_to boxe_path(@boxe)}
      format.js
    end
    else
      respond_to do |format|
      format.html {render 'boxes/show' }
      format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
