class OffersController < ApplicationController

  def new
    @offer = Offer.new
    @auction = Auction.find(params[:auction_id])

  end

  def create
    @auction = Auction.find(params[:auction_id])
      @offer= Offer.new(params.require(:offer).permit(:amount))
      @offer.auction = @auction
      @offer.user = current_user
      if !@auction.max_offer.nil? && @offer.amount <= @auction.max_offer.amount
        flash[:danger] = "El monto debe ser mayor a #{@auction.max_offer.amount}"
        render :new
    elsif @offer.save
        flash[:info] = "Oferta cargada correctamente"
        redirect_to auctions_path
      else
        flash[:danger] = "Error al cargar la oferta"
        render :new
      end
    end



end
