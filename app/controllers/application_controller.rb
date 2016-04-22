class ApplicationController < ActionController::Base


  #Captura de errores y páginas no encontradas
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from AbstractController::ActionNotFound, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  def render_404(exception)
    render template: 'errors/error_404', layout: 'layouts/application', status: 404
  end

  def render_500(exception)
    @error = exception
    render template: 'errors/error_500', layout: 'layouts/application', status: 500
  end


  include ApplicationHelper
  # before_action :unsigned_index, except: [:example]
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
    if devise_controller? && action_name=='new'
      return "devise"
    else
      return "application"
    end
  end

end
