module Api
  class SessionsController < Api::BaseController
    allow_unauthenticated_access only: :create

    api :POST, "/sessions", "Create a new session, return JWT"
    description "Create a new session, return JWT"
    formats [ "json" ]
    param :code, String, desc: "The wechat miniprogram `wx.login` returns code", required: true, missing_message: "The params code required"
    example <<-EOS
      { code: '<wx.login#code>' }
    EOS
    returns code: 200, desc: "A successful response" do
      property :token, String, desc: "The JWT token"
    end
    returns code: 400, desc: "Invalid code" do
      property :message, String, desc: "Error message"
    end
    def create
      code = params[:code]
      if code.blank?
        render json: { message: "The params code required" }, status: :bad_request
        return
      end

      # fetch open_id
      wechat_miniprogram = WechatMiniprogram.new()
      json = wechat_miniprogram.code_to_session(code)
      open_id = json["open_id"]
      if open_id.blank?
        render json: json, status: :bad_request
        return
      end

      user = User.find_by(open_id: open_id)
      if user.blank?
        user = User.create!(
          email: "#{open_id}@fake.mail",
          password: SecureRandom.hex(16),
          provider: "wechat_miniprogram",
          open_id: open_id
        )
      end

      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }
    end
  end
  # private

  # def session_params
  #   params.require(:session).permit(:code)
  # end
end
