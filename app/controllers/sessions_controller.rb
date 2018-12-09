class SessionsController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def show; end

  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: t('controllers.session.create.success')
    else
      flash.now.alert = t('controllers.session.create.errors')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t('controllers.session.destroy.success')
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end

