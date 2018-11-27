class Admin::UsersController < ApplicationController
  def show
  redirect_to admin_users_path
  end
  def index
    @users = User.all
  end
  def edit
    
  end
end
