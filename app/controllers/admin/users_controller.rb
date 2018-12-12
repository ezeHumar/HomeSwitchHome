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
end
