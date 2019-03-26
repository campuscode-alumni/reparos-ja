class ContractorsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @contractors = @category.contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
    if @contractor.profile.nil?
      @contractor.create_profile
    end
  end

  def edit
    @contractor = Contractor.find(params[:id])
   
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update(contractor_params)
      redirect_to @contractor
    else
      render :edit
    end
  end

  def contractor_params
    params.require(:contractor).permit(:name, :email, profile_attributes: [:id, :city])
  end
end