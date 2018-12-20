class AnnualPaymentsController < ApplicationController

  def index
  end

  def create
  end
  def new
    @user.find(params[:id])
    if @annualpayment.created_at + 1.year < Date.today
      @user.increment!(credit: , 2 )
      @user = AnnualPayment.new
    end
    redirect_to admin_users_path
  end
  def edit
  end
  def show
  end
  def update
  end
  def destroy
  end
end
