class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_identity

  private
  def warden
  	request.env['warden']
  end

  def current_identity
    #@current_identity ||= Identity.find(session[:identity_id]) if session[:identity_id]
    warden.user
  end
end
