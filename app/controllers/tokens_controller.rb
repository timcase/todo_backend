class TokensController < ApplicationController
  def create
    user = User.find_for_database_authentication(email: auth_params[:email])
    if user.valid_password?(auth_params[:password])
      render json: JsonWebToken.encode(user), status: :created
    else
      head :not_found
    end
  end


  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
