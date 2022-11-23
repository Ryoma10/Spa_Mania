class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to review_path(@comment.review_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @review = Review.find(@comment.review_id)
    @comment.destroy
    redirect_to review_path(@review.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :review_id)
  end
end
