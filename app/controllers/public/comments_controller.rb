class Public::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    co
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
