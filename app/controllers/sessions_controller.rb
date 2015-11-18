class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    cookies[:auth_token] = {
      value: user.auth_token,
      expires: 30.days.from_now
    }
    uri = session[:referer]
    session[:referer] = nil
    if uri
      redirect_to uri
    else
      # redirect_to identity_path(user.uid)
      redirect_to landing_path
    end
  end

  def destroy
    cookies.delete :auth_token
    redirect_to sign_in_path
  end
end
