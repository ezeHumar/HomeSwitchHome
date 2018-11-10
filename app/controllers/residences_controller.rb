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
    @residence=Residence.find(params[:id])

    if @residence.destroy
      redirect_to residence_path, notice:"La residencia '#{@residence.name}' ha sido eliminada exitosamente"
    else
      redirect_to residences_path, notice:"No se ha podido eliminar la residencia '#{@residence.name}'"
    end
  end

  def edit
    # params = { id: 7}
    @residence = Residence.find(params[:id])
  end


  def update
    @residence = Residence.find(params[:id])

    if @residence.update(residence_params)
      redirect_to residence_path, notice: 'La residencia se ha editado con éxito'
    else
      render :edit
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:name, :location, :capacity, :photos)
  end
end
