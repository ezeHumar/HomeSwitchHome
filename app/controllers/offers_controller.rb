class OffersController < ApplicationController

  def new
    @offer = Offer.new
  end

  def create
      @offer= Offer.new(params.require(:offer).permit(:amount, :auction_id))
      @offer.user = current_user
      if @offer.save
        flash[:info] = "Oferta cargada correctamente"
        redirect_to auctions_path
      else
        flash[:danger] = "Error al cargar la oferta"
        redirect_to auctions_path
      end
    end


end
