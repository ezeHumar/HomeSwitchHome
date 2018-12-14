class WelcomeController < ApplicationController
  def index
    @residences = Residence.all
    @reservations = Reservation.all
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
