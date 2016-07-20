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

  def edit
    @user=User.find(params[:id])
    render :edit
  end

  def update
    @user=User.find(params[:id])

    if !params[:admin]
      params[:admin] = false
    end

    if @user.update(params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
