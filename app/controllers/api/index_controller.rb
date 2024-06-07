module Api
  class IndexController < Api::BaseController
    allow_unauthenticated_access only: :public

    def public
      render json: { now: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
    end

    def protected
      render json: { message: "Protected endpoint" }
    end
  end
end
