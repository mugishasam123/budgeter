class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  def after_sign_in_path_for(_resource)
    categories_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
