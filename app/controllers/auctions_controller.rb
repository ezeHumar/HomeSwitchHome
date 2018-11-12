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


  private
  def auction_params
    params.require(:auction).permit(:residence_id, :date)
  end
  end
