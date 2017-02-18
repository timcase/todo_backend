class UsersController < ApplicationController
  # include ErrorSerializer
  skip_before_action :authenticate_user, only: [:create, :search]
  def index
    render json: User.all
  end

  def search
    user = User.where(email: params[:email]).first
    if user
      render json: user, status: :found
    else
      head :not_found
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: Knock::AuthToken.new(payload: user.to_token_payload), status: :created
    else
      render json: ErrorSerializer.serialize(user.errors), status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end


end

