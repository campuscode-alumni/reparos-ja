class EstimatesController < ApplicationController
  def new
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new
  end

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = @contractor.estimates.build(estimate_params)
    @estimate.user = current_user
    if @estimate.save
      flash[:message] = 'Sua solicitação foi enviada - Aguarde retorno do prestador de serviços'
      redirect_to @contractor
    else
      render :new
    end
  end
  
  private

  def estimate_params
    params.require(:estimate).permit(:description,
      :location, :service_date, :day_shift, :photo)
  end
end