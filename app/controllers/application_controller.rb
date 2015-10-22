class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate!
    unless current_user
      redirect_to sign_in_path
    end
  end
  helper_method :authenticate!

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

end
