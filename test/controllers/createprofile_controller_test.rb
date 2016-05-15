require 'test_helper'

class CreateprofileControllerTest < ActionController::TestCase
  test "should get employer" do
    get :employer
    assert_response :success
  end

  test "should get jobSekker" do
    get :jobSekker
    assert_response :success
  end

end
