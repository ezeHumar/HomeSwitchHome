class ResidencesController < ApplicationController
  def index
    @residences = Residence.all
  end
  def new
    @residence = Residence.new
  end
  def create
    @residence = Residence.new(residence_params)
    if @residence.save
      redirect_to residences_path, notice: "Residencia cargada correctamente"
    else
      render :new
    end
  end
  def destroy
    @residence = Residence.destroy
  end
  def edit
    
  end
  private
  def residence_params
    params.require(:residence).permit(:name, :location, :capacity, :photos)
  end
end
