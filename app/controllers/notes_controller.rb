class NotesController < ApplicationController
  before_action :authorize_user
  before_action :load_notes
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def show
    render :edit
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.new note_params
    set_flash_for @note.save
    render_or_redirect
  end

  def update
    set_flash_for @note.update(note_params)
    render_or_redirect
  end

  def destroy
    set_flash_for @note.destroy
    redirect_to new_note_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body_html)
  end

  def find_note
    @note = current_user.notes.find params[:id]
  end

  def set_flash_for(action_result)
    if action_result
      flash[:notice] = t("note.flash.#{action_name}.success")
    else
      flash.now[:alert] = t("note.flash.#{action_name}.failure")
    end
  end

  def render_or_redirect
    if @note.errors.any?
      render :edit
    else
      redirect_to @note
    end
  end

  def load_notes
    @notes = current_user.notes.all if current_user.present?
  end
end
