require "test_helper"

class JsonWebTokenTest < ActiveSupport::TestCase
  test "the encode/decode" do
    jwt = JsonWebToken.encode(user_id: 1, exp: 7.days.from_now)
    assert_not_nil jwt
    assert_equal 1, JsonWebToken.decode(jwt)[:user_id]
  end
end
