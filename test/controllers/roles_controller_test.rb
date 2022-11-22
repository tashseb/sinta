require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get new" do
    get roles_new_url
    assert_response :success
  end

  test "should get create" do
    get roles_create_url
    assert_response :success
  end
end
