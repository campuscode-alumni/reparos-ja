class ContractorsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @contractors = @category.contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def edit
    @contractor = Contractor.find(params[:id])
    @contractor.profile ||= @contractor.build_profile
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update(contractor_params)
      @contractor.profile.sub_categories = sub_category_params
      redirect_to current_user || current_contractor
    else
      render :edit
    end
  end

  private

  def sub_category_params
    SubCategory.where(id: params[:contractor][:profile_attributes][:sub_category_ids])
  end

  def contractor_params
    params.require(:contractor).permit(:name, :email, profile_attributes: [:id, :city])
  end
end