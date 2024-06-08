module Api
  class SessionsController < Api::BaseController
    allow_unauthenticated_access only: :create

    def create
      render json: { message: "Create session" }
    end
  end
end
