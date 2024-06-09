require "test_helper"

module Api
  class TestControllerTest < ActionDispatch::IntegrationTest
    test "post sessions url w/o code" do
      post api_sessions_url
      assert_response :bad_request
    end

    test "post sessions url w/ invalid code" do
      post api_sessions_url, params: { code: "invalid_code" }
      assert_response :bad_request
    end

    # Current only can get valid code in local environment
    # test "post sessions url w/ valid code" do
    #   code = "From WeChat MiniProgram IDE"
    #   post api_sessions_url, params: { code: code }
    #   assert_response :success
    # end
  end
end
