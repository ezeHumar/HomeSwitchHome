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

     @auction = Auction.new(auction_params.merge(startDate: auction_startDate))

     @auction.amount = 0



 	ok = begin

 		Auction.transaction do

 		  @auction.save!

 		  @reservation = Reservation.new(residence_id: auction_params[:residence_id], reservation_date: auction_params[:startDate], auction_id: @auction.id)

 		  @reservation.save!

 		end

 	rescue

 		nil

 	end



 	if ok

 		flash[:info]="Subasta cargada correctamente"

 		redirect_to auctions_path

 	else

 		flash[:error] = @reservation.errors.full_messages.join(', ')

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
    @offer = Offer.new
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

  def close
      @auction = Auction.find(params[:id])
      offer = @auction.offers.order(amount: :desc).detect do |offer|
        offer.user.credit != 0
      end

      if offer.nil?
        @auction.reservation.update(user: current_user)
        @auction.update(user: current_user)
        flash[:info]='No se adjudicó'
        redirect_to auction_path
      else

        @auction.reservation.update(user: offer.user)
        @auction.update(user: offer.user)
        offer.user.update(credit: offer.user.credit - 1)
        flash[:info]='Cerrada'
        redirect_to auction_path
      end
  end

  def reserve
      @auction = Auction.find(params[:id])

      if current_user.credit > 0
        @auction.reservation.update(user: current_user)
        @auction.update(user: current_user)
        current_user.update(credit: current_user.credit - 1)
        flash[:info]='La reserva se ha realizado con exito'
        redirect_to auction_path

      else
        flash[:info]='No tenés creditos suficientes'
        redirect_to auction_path
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
