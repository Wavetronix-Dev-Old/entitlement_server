class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    cookies.permanent[:auth_token] = user.auth_token
    uri = session[:referer]
    session[:referer] = nil
    if uri
      redirect_to uri
    else
      redirect_to identity_path(user.uid)
    end
  end

  def destroy
    cookies.delete :auth_token
    redirect_to request.referer rescue redirect_to sign_in_path
  end
end
