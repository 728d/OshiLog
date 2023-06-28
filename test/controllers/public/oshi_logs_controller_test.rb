require "test_helper"

class Public::OshiLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_oshi_logs_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_oshi_logs_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_oshi_logs_show_url
    assert_response :success
  end
end
