class ContractorsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @contractors = @category.contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
  end
end