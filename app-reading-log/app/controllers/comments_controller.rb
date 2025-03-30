class CommentsController < ApplicationController
  def create
    @book_note = BookNote.find(params[:book_note_id])
    @comment = @book_note.comments.build(comment_params)
    
    if @comment.save
      redirect_to book_note_path(@book_note), notice: 'メモを追加しました'
    else
      redirect_to book_note_path(@book_note), alert: 'メモの追加に失敗しました'
    end
  end

  def destroy
    @book_note = BookNote.find(params[:book_note_id])
    @comment = @book_note.comments.find(params[:id])
    @comment.destroy
    redirect_to book_note_path(@book_note), notice: 'メモを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:page, :impression)
  end
  
end
