class Admin::UsersController < ApplicationController
  def show
  redirect_to admin_users_path
  end

  def index
    @users = User.all

  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update!(params.require(:user).permit(:premium))
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end

  def give_credit
    @users = User.all
    @users.each do |user|
      if !user.last_credit_date.nil? && user.last_credit_date < Date.today - 1.year
        user.increment!(:credit)
        user.increment!(:credit)
        user.update(last_credit_date: Date.today)
      end
    end
    redirect_to admin_users_path
  end

end
