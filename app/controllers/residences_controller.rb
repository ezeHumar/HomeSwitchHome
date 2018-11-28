class ResidencesController < ApplicationController
  def show
    @residence = Residence.find(params[:id])
  end
  def index
    @residences = Residence.all
  end

  def new
    @residence = Residence.new
  end

  def create
    @residence = Residence.new(residence_params)
    @residence.deleted = false
    if @residence.save
      flash[:info] = "Residencia cargada correctamente"
      redirect_to residences_path
    else
      render :new
    end
  end
  def magia
  end
  def destroy
    residence = Residence.find(params[:id])
    residence.deleted = true
    if residence.deleted == true
      flash[:info] = "La residencia '#{residence.name}' ha sido eliminada exitosamente"
      redirect_to residences_path
    else
      flash[:danger] = "No se ha podido eliminar la residencia '#{residence.name}'"
      redirect_to residence_path(residence)
    end
    residence.save
  end

  def edit
    # params = { id: 7}
    @residence = Residence.find(params[:id])
  end


  def update
    @residence = Residence.find(params[:id])

    if @residence.update(residence_params)
      flash[:info]='La residencia se ha editado con éxito'
      redirect_to residences_path
    else
      render :edit
    end
  end
  def profile
    @residence = Residence.find(params[:id])
  end
  private
  def residence_params
    params.require(:residence).permit(:name, :location, :capacity, :photos)
  end
end
