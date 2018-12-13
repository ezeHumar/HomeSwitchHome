class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
  end

 def index

   begin
     @residence = Residence.find(params[:reservation][:residence_id])
     d_start = params[:reservation][:date_start].to_date
     d_end = params[:reservation][:date_end].to_date
     if d_end - 2.months > d_start
       flash[:info] = "La fecha de fin debe ser como maximo 2 meses despues que la fecha de inicio"
       redirect_to root_path
     else
        @reservations = @residence.reservations.where("reservation_date > ? AND reservation_date < ?", d_start, d_end)
        if !@reservations.any?
          flash[:info] = "No hay reservas para esas fechas"
        end
      end
   rescue
     flash[:info] = "Se deben ingresar ambas fechas y una residencia"
     redirect_to root_path
   end


 end


end
