class UsersController < ApplicationController
  before_action :find_user
  after_action :verify_authorized

  def index
    @users = User.order("id").all
    authorize :user
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: %(Updated "#{@user.name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path
  end

private

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end
