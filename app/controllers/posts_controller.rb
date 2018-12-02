class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to({ action: :index }, notice: 'Post was successfully saved!')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes(posts_params)
      redirect_to({ action: :index }, notice: 'Post was successfully updated!')
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to({ action: :index }, notice: 'Post was successfully deleted!')
    else
      redirect_to({ action: :index }, notice: 'Post was not deleted!')
    end
  end

  private

  def posts_params
    params.require(:post).permit(
      :title, :body)
  end
end
