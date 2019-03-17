class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:category][:name]
    if @category.save
      redirect_to category_contractors_path(@category)
    else
      render :edit
    end
  end
  
end