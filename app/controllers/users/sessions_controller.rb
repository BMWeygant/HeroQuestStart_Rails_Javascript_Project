# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def new
    redirect_to "https://id.heroku.com/oauth/authorize?client_id={client-id}&response_type=code&scope={scopes}&state={anti-forgery-token}"
    redirect_to "{redirect-uri}?code={code}&state={anti-forgery-token}"
  end

  def create
    access_token = request.env['omniauth.auth']['credentials']['token']
    heroku_api = Heroku::API.new(api_key: access_token)
    @apps = heroku_api.get_apps.body
  end
  # GET /resource/sign_in
  # def new
  # end

  # # POST /resource/sign_in
  # def create
  #   user = User.find_by(:name => params[:user][:name])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to user_path(user)
  #   else
  #     render :new
  #   end
  # end

  # DELETE /resource/sign_out
  def destroy
    if current_user
      session.delete :user_id
      redirect_to root_path

    end
   end

  def after_sign_in_path_for(_resource)
    root_path
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
