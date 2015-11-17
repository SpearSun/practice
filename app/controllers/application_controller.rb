class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :admin?

  def require_admin
    if not admin? 
      flash[:error] = "Authorization required!"
      redirect_to home_path
    end
  end

  def require_login
    if not logged_in?
      flash[:error] = "Please login!"
      redirect_to log_in_path
    end
  end

  def validate_user
    Rails::logger.info("Validate user #{params[:user_id]} and #{current.id.class} and #{current_user.id.to_s != params[:user_id]}")
    if current_user.id.to_s != params[:user_id]
      Rails::logger.info("Illegal operation!")
      flash[:error] = "Illegal operation!"
      redirect_to home_path
    end
  end

  private
  def current_user
    Rails::logger.info("Retrieve current user object by user_id #{session[:user_id]}")
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  def admin?
    current_user.admin
  end
end
