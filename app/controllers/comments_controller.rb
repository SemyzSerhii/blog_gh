class CommentsController < ApplicationController
  before_action :find_comment, only: %i[ destroy ]

  def create
      current_user.comments.create(comments_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body, :post_id)
  end
end


