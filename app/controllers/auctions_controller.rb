class AuctionsController < ApplicationController
  def show
    redirect_to auctions_path
  end

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    begin

    auction_startDate = Date.strptime(auction_params[:startDate], '%d/%m/%Y') - 6.months
    rescue
      auction_startDate = nil
    end

    @auctions = Auction.all
    @auction = Auction.new(auction_params.merge(startDate: auction_startDate, user: current_user))
    @auction.amount = 0

    if @auction.save
      Reservation.create(residence_id: auction_params[:residence_id], reservation_date: auction_params[:startDate], auction_id: @auction.id)
      flash[:info]="Subasta cargada correctamente"
      redirect_to auctions_path
    else
      render :new
    end
  end

  def destroy
    auction = Auction.find(params[:id])

    if auction.destroy
      flash[:info]="La subasta ha sido eliminada exitosamente"
      redirect_to auctions_path
    else
      flash[:info]="No se ha podido eliminar la subasta"
      redirect_to auctions_path
    end
  end

  def edit
    # params = { id: 7}
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])

    if @auction.update(auction_params_edit.merge(user: current_user))
      flash[:info]='¡La subasta se ha realizado con éxito!'
      redirect_to auction_path
    else
      render :edit
    end
  end



  private

  def auction_params_edit
    params.require(:auction).permit(:email, :amount)
  end

  def auction_params
    params.require(:auction).permit(:residence_id, :startDate)
  end

end
