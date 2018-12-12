class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
  end

 def index
   @residence = Residence.find(params[:residence_id])
   @reservations = @residence.reservations
 end


end
