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
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auctions_path, notice: "Subasta cargada correctamente"
    else
      render :new
    end
  end
  def destroy
    auction = Auction.find(params[:id])

    if auction.destroy
      redirect_to auctions_path, notice: "La subasta ha sido eliminada exitosamente"
    else
      redirect_to auctions_path, notice: "No se ha podido eliminar la subasta"
    end
  end

  def edit
    # params = { id: 7}
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])

    if @auction.update(params.require(:auction).permit(:email, :amount))
      flash[:info]='¡La subasta se ha realizado con éxito!'
      redirect_to auction_path
    else
      render :edit
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:residence_id, :date)
  end
end
