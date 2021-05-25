class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
      @token = Tokenizer.encode(@user)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: current_user }, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
