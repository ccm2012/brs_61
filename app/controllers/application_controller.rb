class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :book_categories

  rescue_from CanCan::AccessDenied, with: :not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
  end

  def not_authorized
    flash[:warning] = t "user_for.not_authorized"
    redirect_to root_url
  end

  def book_categories
    @categories = Category.all
  end
end
