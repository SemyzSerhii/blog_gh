class CommentsController < ApplicationController
  before_action :find_comment, only: %i[update destroy]

  def _index
    @comments = Comment.all
  end

  def create
    @comment = current_user.comments.build(comments_params)
  end

  def update
    if @comment.update_attributes(comments_params)
      redirect_to({ action: :_index })
    end
  end

  def destroy
    if @post.destroy
      redirect_to({ action: :_index })
    else
      redirect_to({ action: :_index })
    end
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end


