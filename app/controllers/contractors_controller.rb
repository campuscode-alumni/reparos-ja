class ContractorsController < ApplicationController
  def index
    @contractors = Category.find(params[:category_id]).contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
  end
end