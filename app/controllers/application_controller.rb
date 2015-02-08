class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  check_authorization :unless => :devise_controller?

  #Se o usuário tentar acessar uma página para a qual não tem acesso, receberá um alerta 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: 'Você não está autorizado a acessar esta página.'
  end

  protected

  def configure_permitted_parameters
	# Add my attributes added to the devise User class
	devise_parameter_sanitizer.for(:sign_up) << :nome 
	devise_parameter_sanitizer.for(:account_update) << :nome
  end
end
