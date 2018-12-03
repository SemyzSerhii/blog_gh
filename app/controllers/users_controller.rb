class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_path, notice: t('controllers.user.create.success')
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end


  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
end
