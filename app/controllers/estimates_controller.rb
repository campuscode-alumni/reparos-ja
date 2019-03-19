class EstimatesController < ApplicationController
  def index
    @estimates = logged.estimates
  end

  def new
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  private

  def logged
    current_user || current_contractor 
  end
end