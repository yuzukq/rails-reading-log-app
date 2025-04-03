class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_note
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @book_note.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to book_note_path(@book_note), notice: 'メモを追加しました'
    else
      redirect_to book_note_path(@book_note), alert: 'メモの追加に失敗しました'
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to book_note_path(@book_note), notice: 'メモを削除しました'
    else
      redirect_to book_note_path(@book_note), alert: 'この操作は許可されていません'
    end
  end

  private

  def set_book_note
    @book_note = BookNote.find(params[:book_note_id])
  end

  def set_comment
    @comment = @book_note.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:page, :impression)
  end
end
