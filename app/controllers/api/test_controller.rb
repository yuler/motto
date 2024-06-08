module Api
  class TestController < Api::BaseController
    allow_unauthenticated_access only: :public

    api :GET, "/public", "Test `public` endpoint"
    description "Only for test api `public` endpoint work"
    returns code: 200, desc: "A successful response" do
      property :now, String, desc: "Current time"
    end
    def public
      render json: { now: Time.now.strftime("%Y-%m-%d %H:%M:%S") }
    end

    api :GET, "/protected", "Test `protected` endpoint"
    description "Only for test api `protected` endpoint work"
    formats [ "json" ]
    meta Protected: true
    returns code: 200, desc: "A successful response" do
      property :message, String, desc: "Protected endpoint"
    end
    example '{ "message": "Protected endpoint" }'
    def protected
      render json: { message: "Protected endpoint" }
    end
  end
end
