class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def posts
    if current_user
      @posts = User.find(current_user.id).posts
    else
      redirect_to root_path
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_path, notice: t('controllers.user.create.success')
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(users_params)
      redirect_to @user, notice: t('controllers.post.update.success')
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end


  def users_params
    params.require(:user).permit(:username, :email, :password, cover_attributes: %i[id url])
  end
end
