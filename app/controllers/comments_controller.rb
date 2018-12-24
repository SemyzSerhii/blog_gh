class CommentsController < ApplicationController
  before_action :find_comment, only: %i[ destroy ]

  def create
    @comment = Comment.create(comments_params)
    respond_to :js
  end

  def destroy
    @comment.destroy
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.permit(:body, :post_id, :user_id, :likes_count)
  end
end


