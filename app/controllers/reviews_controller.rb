class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @store = Store.find(params[:store_id])
    @review = @store.reviews.build
  end

  def create
    @store = Store.find(params[:store_id])
    @review = @store.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to store_path(@store), notice: 'レビューを投稿しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
