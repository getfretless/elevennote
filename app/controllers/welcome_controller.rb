class WelcomeController < ApplicationController
  before_action :authorize_user
  def index
    redirect_to new_note_path
  end
end
