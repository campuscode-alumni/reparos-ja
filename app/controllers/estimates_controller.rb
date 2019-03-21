class EstimatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @estimates = logged.estimates
  end
  
  def new
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new
  end

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = @contractor.estimates.build(estimate_params)
    @estimate.user = current_user
    if @estimate.save
      @estimate.requested!
      flash[:message] = 'Sua solicitação foi enviada - Aguarde retorno do prestador de serviços'
      ContractorsMailer.notify_new_estimate(@contractor.id, @estimate.id)
      redirect_to @contractor
    else
      render :new
    end
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
    @estimate.approved_contractor!
    if @estimate.update(parameters)
      EstimatesMailer.notify_estimate_response(@estimate.id)
      redirect_to @estimate
    end
  end
  
  def approve
    @estimate = Estimate.find(params[:id])
    @estimate.approved_user!
    @estimate.save
    flash[:approved_user] = t(:estimate_approved_by_user)
    redirect_to @estimate
  end

  private

  def logged
    current_user || current_contractor 
  end

  def contractor_params
    params.require(:estimate).permit(:total_hours, :visit_fee, :material_fee, :material_list, :service_fee)
  end

  def estimate_params
    params.require(:estimate).permit(:description,
      :location, :service_date, :day_shift, :photo)
  end
end