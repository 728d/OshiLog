require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_customers_index_url
    assert_response :success
  end

  test "should get comfirm_withdraw" do
    get public_customers_comfirm_withdraw_url
    assert_response :success
  end
end
