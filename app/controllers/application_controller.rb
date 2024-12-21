class ApplicationController < ActionController::API
  # Authenticate the user using JWT token
  def current_user
    @current_user ||= User.find(decoded_token[:user_id]) if decoded_token
  end

  # Ensure user is authenticated
  def authenticate_user!
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end

  private

  def decoded_token
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      JsonWebToken.decode(token)
    end
  end
end
