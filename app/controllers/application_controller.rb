class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    nil
  end

  def user_signed_in?
    return true if current_user.present?
  end

  def correct_user?
    @user = User.find(params[:id])
    return if current_user == @user
    redirect_to root_url, alert: "Access denied."
  end

  def authenticate_user!
    return if current_user.present?
    redirect_to root_url, alert: 'You need to sign in for access to this page.'
  end
end
