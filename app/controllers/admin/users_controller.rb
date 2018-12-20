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
<<<<<<< HEAD
      if !user.last_credit_date.nil? && user.last_credit_date < Date.today - 1.year
        user.increment!(:credit, by = 2)
        user.update(last_credit_date: Date.today)
      end
    end
    redirect_to admin_users_path
=======
      redirect_to new_annual_payment(:id)
      end
>>>>>>> 217b2d6621ef0c270beede637d9cdb6fcc630ec8
  end

end
