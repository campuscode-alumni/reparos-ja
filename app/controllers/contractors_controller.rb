class ContractorsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @contractors = @category.contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def edit
    @contractor = current_contractor
    @contractor.profile ||= @contractor.build_profile
  end

  def update
    @contractor = Contractor.find(params[:id])
    @contractor.update(contractor_params)
    @contractor.profile.sub_categories = sub_categories_params
    redirect_to @contractor
  #  @contractor = Contractor.find(params[:id])
  #  if @contractor.update(contractor_params)
  #    redirect_to root_path
  #  else
  #    render :edit
  #  end
  end

  private
  
  def contractor_params
    params.require(:contractor).permit(:name, :email, :cpf, profile_attributes: [:id, :city])
  end

  def sub_categories_params
    SubCategory.where(id: params[:contractor][:profile_attributes][:sub_category_ids])
  end
end