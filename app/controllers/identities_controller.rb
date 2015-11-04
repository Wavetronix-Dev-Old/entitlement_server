class IdentitiesController < ApplicationController
  skip_before_action :authenticate!, only: [:new]

  before_action :find_identity
  before_action :find_user

  def show
  end

  def new
    @identity = env["omniauth.identity"]
  end

  def edit
  end

  def update
    if @identity.update_attributes(identity_params)
      @user.first_name = @identity.first_name
      @user.last_name = @identity.last_name
      @user.email = @identity.email
      @user.save
      redirect_to users_path, notice: %(Updated "#{@identity.first_name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    @identity.destroy
    @user.destroy
    redirect_to users_path
  end

  def authentication_failure
    redirect_to sign_in_path, alert: params[:message].humanize
  end

  private

  def identity_params
    params.require(:identity).permit(:first_name, :last_name, :email, :uid, :auth_token, :provider)
  end

  def user_params
    params.require(@user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_identity
    @identity = Identity.find(params[:id]) if params[:id]
  end

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
end
