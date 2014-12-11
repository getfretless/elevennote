class API::APIController < ApplicationController
  skip_before_action :verify_authenticity_token

  protected

  def authorize_api_key
    if current_api_user.nil?
      render nothing: true, status: :unauthorized
    end
  end

  private

  def current_api_user
    @current_api_user ||= User.find_by(api_key: params[:api_key]) if params[:api_key]
  end

end
