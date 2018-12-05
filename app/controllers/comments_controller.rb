class CommentsController < ApplicationController
    before_action :find_comment, only: %i[update destroy]

    def index
      @comments = Comment.all
    end


    def new
      @comment = Comment.new
    end

    def create
      @comment = current_user.comments.build(comments_params)
      if @comment.save
        redirect_to({ action: :index })
      else
        render :new
      end
    end

    def update
      if @comment.update_attributes(comments_params)
        redirect_to({ action: :index })
      end
    end

    def destroy
      if @post.destroy
        redirect_to({ action: :index })
      else
        redirect_to({ action: :index })
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


