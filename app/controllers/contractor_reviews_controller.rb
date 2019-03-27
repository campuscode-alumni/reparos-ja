class ContractorReviewsController < ApplicationController
  def new
    @contractor_review = ContractorReview.new
    @service_order = ServiceOrder.find(params[:service_order_id])
  end

  def create
    @contractor_review = ContractorReview.new(review_params)
    @contractor_review.service_order_id = params[:service_order_id]
    @contractor_review.save
    redirect_to contractor_path(@contractor_review.service_order.estimate.contractor)
  end

private

  def review_params
    params.require(:contractor_review).permit(:comment, :rating)
  end
end