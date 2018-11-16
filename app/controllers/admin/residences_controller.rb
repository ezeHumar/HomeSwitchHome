class Admin::ResidencesController < ApplicationController
  def show
    redirect_to admin_residences_path
  end
  def index
    @residences = Residence.all
    if @residences.blank?
      flash[:info] = "No hay residencias cargadas"
    end
  end
  def new
    @residence = Residence.new
  end
  def create
    @residence = Residence.new(residence_params)
    if @residence.save
      flash[:info] = "Residencia cargada correctamente"
      redirect_to admin_residences_path
    else
      render :new
    end
  end

  def destroy
    residence = Residence.find(params[:id])

    if residence.destroy
      flash[:info] = "La residencia '#{residence.name}' ha sido eliminada exitosamente"
      redirect_to admin_residences_path
    else
      flash[:danger] = "No se ha podido eliminar la residencia '#{residence.name}'"
      redirect_to admin_residence_path(residence)
    end
  end

  def edit
    # params = { id: 7}
    @residence = Residence.find(params[:id])
  end


  def update
    @residence = Residence.find(params[:id])

    if @residence.update(residence_params)
      flash[:info]='La residencia se ha editado con éxito'
      redirect_to admin_residence_path(@residence)
    else
      render :edit
    end
  end

  private
  def residence_params
    params.require(:residence).permit(:name, :location, :capacity, :photos)
  end
end
