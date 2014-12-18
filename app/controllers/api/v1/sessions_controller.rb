class API::V1::SessionsController < API::APIController

  def create
    @user = User.find_by username: user_params[:username]
    if @user.present? && @user.authenticate(user_params[:password])
      render
    else
      render json: { error: t('session.flash.create.failure'), status: :unprocessable_entity }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end