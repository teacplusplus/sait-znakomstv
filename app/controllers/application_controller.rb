class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :remote_ip

  def remote_ip
    request.headers['HTTP_X_REAL_IP'] || request.remote_ip
  end
end
