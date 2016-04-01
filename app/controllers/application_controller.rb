class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalsResponder
    respond_with *args, options, &blk
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation,
                                                           :username, :name, :surname1, :surname2, :sku, :birthday, :phone)}
  end

  # Sin layout para páginas de devise
  
  layout :layout

  private

  def layout
    devise_controller? && "application"
  end

end
