class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to({ action: :index }, notice: t('controllers.post.create.success'))
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes(posts_params)
      redirect_to({ action: :index }, notice: t('controllers.post.update.success'))
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to({ action: :index }, notice: t('controllers.post.destroy.success'))
    else
      redirect_to({ action: :index }, notice: t('controllers.post.destroy.errors'))
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(
      :title, :body, cover_attributes: %i[id url]
    )
  end
end
