class EstimatesController < ApplicationController
  def new
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(params.require(:estimate).permit(:description,
      :location, :service_date, :day_shift, :photo))
    @estimate.contractor_id = params[:contractor_id]
    @estimate.save
    flash[:message] = 'Sua solicitação foi enviada - Aguarde retorno do prestador de serviços'
    redirect_to contractor_path(params[:contractor_id])
  end
end