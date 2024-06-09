require "test_helper"

module Api
  class TestControllerTest < ActionDispatch::IntegrationTest
    test "test public api success w/ 200" do
      get api_public_url
      assert_response :success
    end

    test "test protected api success w/ 401" do
      get api_protected_url
      assert_response :unauthorized
    end

    test "test protected api success w/ 200" do
      get api_protected_url, headers: { "Authorization" => "Bearer #{JsonWebToken.encode(user_id: users(:one).id)}" }
      assert_response :success
    end
  end
end
