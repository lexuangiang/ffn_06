class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :load_user, only: :destroy
  def index
    @user = User.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.deleted"
      redirect_to admin_users_path
    else
      flash[:warning] = t "users.destroy_fail"
      redirect_to root_path
    end
  end
end
