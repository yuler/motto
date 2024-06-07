class WechatMiniprogram
  # include Retryable?
  # initialize?
  @base_url = "https://api.weixin.qq.com"
  @app_id = Rails.application.credentials.dig(:wechat_miniprogram, :app_id)
  @secret = Rails.application.credentials.dig(:wechat_miniprogram, :app_secret)

  def self.configured?
    @app_id.present? && @secret.present?
  end

  # refs: https://developers.weixin.qq.com/miniprogram/dev/OpenApiDoc/mp-access-token/getAccessToken.html
  def self.get_access_token
    response = Faraday.get("#{@base_url}/cgi-bin/token?grant_type=client_credential&appid=#{@app_id}&secret=#{@secret}")

    if response.success?
      # New error
      JSON.parse(response.body)
    else
      # Throw error?
    end
  end

  # refs: https://developers.weixin.qq.com/miniprogram/dev/OpenApiDoc/user-login/code2Session.html
  def code_to_session(code)
    response = Faraday.get("#{@base_url}/sns/jscode2session?appid=#{@app_id}&secret=#{@secret}&js_code=#{code}&grant_type=authorization_code")

    if response.success?
      # New error
      JSON.parse(response.body)
    else
      # Throw error?
    end
  end
end
