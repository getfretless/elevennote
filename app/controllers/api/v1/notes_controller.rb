class API::V1::NotesController < API::APIController

  before_action :authorize_api_key

  def index
    @notes = current_api_user.notes.all
  end

  def show
    @note = current_api_user.notes.find params[:id]
  end

end
