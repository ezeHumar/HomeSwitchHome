class Admin::AuctionsController < ApplicationController
  def show
    redirect_to admin_auctions_path
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
      redirect_to admin_auctions_path, notice: "Subasta cargada correctamente"
    else
      render :new
    end
  end
  def destroy
    auction = Auction.find(params[:id])

    if auction.destroy
      redirect_to admin_auctions_path, notice: "La subasta ha sido eliminada exitosamente"
    else
      redirect_to admin_auctions_path, notice: "No se ha podido eliminar la subasta"
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:residence_id, :date)
  end
end
