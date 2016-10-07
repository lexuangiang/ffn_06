class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
  def logged_in_user
    unless logged_in?
      flash[:danger] = t "users.pleaselogin"
      redirect_to new_user_path
    end
  end

  def verify_admin
    redirect_to root_url unless current_user.isadmin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "users.not_found"
      redirect_to root_path
    end
  end
end
