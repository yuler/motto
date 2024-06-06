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
    # TODO: decode jwt, mock a user
    user = { id: 1, token: token }
    # user = Token.find_by(value: token)&.user

    unless user
      render json: { message: "Unauthorized" }, status: :unauthorized
      return
    end

    Current.user = user
  end
end
