class ApplicationController < ActionController::API
  before_action :authorized

  private

  def current_user
    Tokenizer.decode(request.headers["Authorization"])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
  end
end
