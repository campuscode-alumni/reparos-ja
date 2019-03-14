class ContractorsController < ApplicationController
  def index
    @contractors = Category.find(params[:category_id]).contractors
  end
end