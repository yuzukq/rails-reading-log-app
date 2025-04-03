class BookNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_note, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    @book_notes = BookNote.all
  end

  def show
  end

  def new
    @book_note = current_user.book_notes.build
  end

  def create  
    @book_note = current_user.book_notes.build(book_note_params)
    if @book_note.save
      redirect_to book_notes_path, notice: '読書メモが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book_note.update(book_note_params)
      redirect_to book_note_path(@book_note), notice: '読書メモが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book_note.destroy
    redirect_to book_notes_path, notice: '読書メモが削除されました'
  end

  private

  def set_book_note
    @book_note = BookNote.find(params[:id])
  end

  def check_ownership
    unless @book_note.user == current_user
      redirect_to book_notes_path, alert: 'この操作は許可されていません'
    end
  end

  def book_note_params
    params.require(:book_note).permit(:title, :author, :status, :begin_date, :end_date, :content)
  end
end