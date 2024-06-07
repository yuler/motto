module ApiAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :required_authenticate
  end

  class_methods do
    def allow_unauthenticated_access(**)
      skip_before_action(:required_authenticate, **)
    end
  end

  private

  # Authorization: Bearer <Your-Token> or `?token=<Your-Token>` in query string
  def required_authenticate
    token = request.headers["Authorization"]&.remove("Bearer ")
    if params[:token]
      token = params[:token]
    end

    unless token
      render json: { message: "Missing `Authorization` in header" }, status: :unauthorized
      return
    end

    authenticate_as(token)
  end

  def authenticate_as(token)
    begin
      @decoded = JsonWebToken.decode(token)
      Current.user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
