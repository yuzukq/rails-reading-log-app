class BookNotesController < ApplicationController
  def index
    @book_notes = BookNote.all
  end

  def show
    @book_note = BookNote.find(params[:id])
  end

  def new
    @book_note = BookNote.new 
  end

  def create  
    @book_note = BookNote.new(book_note_params)
    if @book_note.save
      redirect_to book_notes_path, notice: '読書メモが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book_note = BookNote.find(params[:id])
  end

  def update
    @book_note = BookNote.find(params[:id])
    if @book_note.update(book_note_params)
      redirect_to book_note_path(@book_note), notice: '読書メモが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book_note = BookNote.find(params[:id])
    @book_note.destroy
    redirect_to book_notes_path, notice: '読書メモが削除されました'
  end

  private

  def book_note_params
    params.require(:book_note).permit(:title, :author, :status, :begin_date, :end_date, :content)
  end
end