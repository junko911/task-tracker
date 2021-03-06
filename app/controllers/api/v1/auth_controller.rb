class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      token = Tokenizer.encode(@user)
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: "Invalid username or password. Please try again." }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end
