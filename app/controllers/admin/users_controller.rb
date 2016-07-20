class Admin::UsersController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def index
    @users = User.page(params[:page])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
