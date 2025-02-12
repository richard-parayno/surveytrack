require "test_helper"

class AccountRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get account_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get account_registrations_create_url
    assert_response :success
  end
end
