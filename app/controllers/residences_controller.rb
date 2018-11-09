class ResidencesController < ApplicationController
  def index
    @residences = Residence.all
  end
  def new
    @residences = Residence.new
  end
end
