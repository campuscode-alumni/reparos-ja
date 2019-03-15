class HomeController < ApplicationController
  def index
    @contractors = Contractor.all
  end
end