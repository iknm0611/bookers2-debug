class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    if  @book_comment.save
    redirect_to book_path(@book)
    else
    @user = @book.user
    @book_new = Book.new
    @book_comments = @book.book_comments

    end
  end

  def destroy
    @book = Book.find(params[:book_id])
  	book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy

    # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
