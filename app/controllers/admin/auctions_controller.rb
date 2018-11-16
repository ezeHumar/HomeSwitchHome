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
    @auction.amount = 0

    if @auction.save
      flash[:info]="Subasta cargada correctamente"
      redirect_to admin_auctions_path
    else
      render :new
    end
  end
  def destroy
    auction = Auction.find(params[:id])

    if auction.destroy
      flash[:info]="La subasta ha sido eliminada exitosamente"
      redirect_to admin_auctions_path
    else
      flash[:info]="No se ha podido eliminar la subasta"
      redirect_to admin_auctions_path
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:residence_id, :startDate)
  end
end
