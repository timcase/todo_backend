class TokensController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_for_database_authentication(email: auth_params[:email])
    if user.valid_password?(auth_params[:password])
      render json: {jwt: JWTWrapper.encode(user)}.to_json, status: :created
    else
      head :not_found
    end
  end

  def auth_params
    params.require(:auth).permit(:email, :password)
  end

end
