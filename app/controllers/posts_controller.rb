class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :posts_all, only: %i[index draft]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order(created_at: :desc)
      end
  end

  def draft; end

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
      :title, :body, :link_video, :published, :likes_count, cover_attributes: %i[id url]
    )
  end

  def posts_all
    @posts =
      if params[:user_id].present?
        Post.where(user_id: params[:user_id])
      else
        Post.all
      end
  end
end

