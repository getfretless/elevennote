class UsersController < ApplicationController
  layout 'landing'

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: t('user.flash.create.success')
    else
      flash.now[:alert] = t('user.flash.create.failure')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end
end
