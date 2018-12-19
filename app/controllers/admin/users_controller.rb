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
    @users.each do |user|
      redirect_to new_annual_payment(:id)
      end
  end
end
