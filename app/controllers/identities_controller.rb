class IdentitiesController < ApplicationController
  before_action :authenticate!, only: [:index, :show]
  before_action :find_identity
  require 'bcrypt'

  def new
    @identity = env["omniauth.identity"]
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @identity.update_attributes(identity_params)
      @identity = Identity.find(1)
      @identity.password = "newpassword"
      @identity.password_confirmation = "newpassword"
      @identity.save
      redirect_to edit_identity_path(current_user.uid), notice: %(Updated "#{@identity.first_name}" successfully.)
    else
      render :edit
    end
  end

  def authentication_failure
    redirect_to sign_in_path, alert: params[:message].humanize
  end

  private

  def identity_params
    params.require(:identity).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_identity
    @identity = Identity.find(params[:id]) if params[:id]
  end
end
