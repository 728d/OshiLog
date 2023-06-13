require "test_helper"

class Public::ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_managements_index_url
    assert_response :success
  end
end
