class UsersController < ApplicationController

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = I18n.t "users.not_found"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t "users.success"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :user_name, :email, :password,
      :password_confirmation, :is_admin, :coin
  end
end
