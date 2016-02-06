class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def test_exception_notification
    raise 'Testing Exception Notification...'
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def login_required
    unless current_user
      @user = User.new
      @original_url = request.original_url
      flash.alert = "You need to be logged in!"
      render 'sessions/login'
    end
  end
end
