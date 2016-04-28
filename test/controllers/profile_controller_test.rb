require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get profile_pic_location:string" do
    get :profile_pic_location:string
    assert_response :success
  end

  test "should get website_url:string" do
    get :website_url:string
    assert_response :success
  end

  test "should get last_updated:string" do
    get :last_updated:string
    assert_response :success
  end

  test "should get about_me:text" do
    get :about_me:text
    assert_response :success
  end

end
