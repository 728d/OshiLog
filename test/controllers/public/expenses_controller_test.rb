require "test_helper"

class Public::ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_expenses_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_expenses_edit_url
    assert_response :success
  end
end
