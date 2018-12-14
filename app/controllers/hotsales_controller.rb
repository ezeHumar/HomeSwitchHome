class HotsalesController < ApplicationController
  def show
    redirect_to hotsales_path
  end

  def index
    @hotsales = Hotsale.all
    if @hotsales.length == 0
      flash[:warning]="Por el momento no hay ofertas"
    end
  end

  def new
    @hotsale = Hotsale.new
    #@reservations = Reservation.all.where(@user.admin?)
  end

  def create
    @hotsales = Hotsale.all
    #@reservations = Reservation.all.where(user_id: nil)
    @hotsale = Hotsale.new(hotsale_params)
    if @hotsale.save
      flash[:info]="Hot-sale cargado correctamente"
      redirect_to hotsales_path
    else
      render :new
    end
  end

  def destroy

  end

  def edit

  end

  def update

  end
  def buy_hotsale
    @hotsale = Hotsale.find(params[:id])
    @hotsale.reservation.update(user: current_user)
    flash[:info]='La promoción se ha comprado con éxito'
    redirect_to hotsales_path
  end
private
def hotsale_params
  params.require(:hotsale).permit(:reservation_id, :name, :amount)
end

end
