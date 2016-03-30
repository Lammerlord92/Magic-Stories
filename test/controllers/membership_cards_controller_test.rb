require 'test_helper'

class MembershipCardsControllerTest < ActionController::TestCase
  test "should get exchange" do
    get :exchange
    assert_response :success
  end

end
