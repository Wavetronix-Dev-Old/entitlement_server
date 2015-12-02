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
    redirect_path = root_path
    if user.created_at > 1.minute.ago
      redirect_path = confirmation_path
    else
      redirect_path = uri if uri
    end
    redirect_to redirect_path
  end

  def destroy
    cookies.delete :auth_token
    redirect_to sign_in_path
  end
end
