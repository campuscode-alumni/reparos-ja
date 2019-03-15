class EstimatesController < ApplicationController
  def new
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new
  end
end