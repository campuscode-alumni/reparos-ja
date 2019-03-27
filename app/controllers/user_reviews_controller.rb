class UserReviewsController < ApplicationController
  def new
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new
  end
  def create
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new(user_review_params)
    @user_review.service_order = @service_order
    @user_review.user = @service_order.estimate.user

    if @user_review.save
      redirect_to user_path(@user_review.user)
    end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:rating, :comment)
  end
end