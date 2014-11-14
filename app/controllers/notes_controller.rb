class NotesController < ApplicationController
  def show
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find params[:id]
  end

  def create
    @note = Note.new note_params
    if @note.save
      flash.now[:notice] = t('note.flash.create.success')
      render :edit
    else
      flash.now[:alert] = t('note.flash.create.failure')
      render :new
    end
  end

  def update
    @note = Note.find params[:id]
    if @note.update note_params
      flash.now[:notice] = t('note.flash.update.success')
    else
      flash.now[:alert] = t('note.flash.update.failure')
    end
    render :edit
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :body_html)
  end
end
