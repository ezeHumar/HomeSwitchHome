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

    Auction.transaction do
      @auction.save!
      @reservation = Reservation.new(residence_id: auction_params[:residence_id], reservation_date: auction_params[:startDate], auction_id: @auction.id)
      @reservation.save!
      flash[:info]="Subasta cargada correctamente"
      redirect_to auctions_path
    end
  rescue
    flash[:error] = @reservation.errors.full_messages.join(', ')
    render :new
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
      i = 1
      b = 0 #Va a ser 0 siempre que no se llegue a la menor oferta (osea la ultima)
      while b == 0 && @auction.offers.order(amount:).last(i).first == 0 do
        i = i+1
        if @auction.offers.order(amount:).last(i).first == @auction.offers.order(amount:).first
          b=1
        end
      end

      if b = 0
        #crear nueva hot-sale porque no hay usuarios con credito
      else
        #@auction.user = @auction.offers.order(amount:).last(i).first.user
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
