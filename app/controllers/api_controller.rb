class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private
  def authenticated?
    authenticate_or_request_with_http_basic {|email, conf_token| User.where(email: email, confirmation_token: conf_token).present? }
  end

end
