class UsersController < ApplicationController
  # include ErrorSerializer
  skip_before_action :authenticate_user!, only: [:create]
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {jwt: JWTWrapper.encode(user)}.to_json, status: :created
    else
      render json: {error: 'oops'}, status: :unprocessable_entity
      # render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end


end

