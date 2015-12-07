class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = warden.authenticate!(scope: :user)
    token = Tiddle.create_and_return_token(user, request)
    render json: { authentication_token: token }
  end

  # DELETE /resource/sign_out
  def destroy
   Tiddle.expire_token(current_user, request) if current_user
   render json: {}
 end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  private
  def verify_signed_out_user
  end
end
