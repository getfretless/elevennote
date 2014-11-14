class WelcomeController < ApplicationController
  before_action :authorize_user
  def index
    redirect_to new_note_path
  end

  private

  def home_page
    if current_user.notes.any? &:persisted?
      note_path Note.latest
    else
      new_note_path
    end
  end
end
