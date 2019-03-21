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

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    parameters = contractor_params if current_contractor
    if @estimate.update(parameters)
      EstimatesMailer.notify_estimate_response(@estimate.id)
      redirect_to @estimate
    end
  end


  private

  def logged
    current_user || current_contractor 
  end

  def user_params
    params.require[:estimate]
  end

  def contractor_params
    params.require(:estimate).permit(:total_hours, :visit_fee, :material_fee, :material_list, :service_fee)
  end
end