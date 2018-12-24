class LikesController < ApplicationController
  def create
    if params[:post_id].present?
      @post = Post.find(params[:post_id])
      @post_like = @post.likes.create(user:current_user)
    else
      @comment = Comment.find(params[:comment_id])
      @comment_like = @comment.likes.create(user:current_user)
    end
  end
end