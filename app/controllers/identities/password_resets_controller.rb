module Identities
  class PasswordResetsController < ApplicationController
    skip_before_action :authenticate!

    # GET /identities/password_resets/new
    def new
    end

    def edit
      @identity = Identity.find_by_password_reset_token!(params[:id])
    end

    def create
      identity = Identity.find_by_email(params[:email])
      # if identity
      #   identity.send_password_reset
      #   redirect_to root_path, :notice => "Email sent with password reset instructions"
      # else
      #   flash.now[:danger] = "Email address not found"
      #   render 'new'
      # end
      ############################### this won't let person know if user is registered
      identity.send_password_reset if identity
      redirect_to root_path, :notice => "We sent password reset instructions to the email address provided."
    end

    def update
      @identity = Identity.find_by_password_reset_token!(params[:id])
      if @identity.password_reset_sent_at < 2.hours.ago
        redirect_to new_identities_password_reset_path, :alert => "Password reset has expired."
      elsif @identity.update_attributes(params[:identity])
        redirect_to root_path, :notice => "Password successfully reset."
      else
        render :edit
      end
    end

  end
end
