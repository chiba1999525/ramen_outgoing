require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get customers_index,_url
    assert_response :success
  end

  test "should get show," do
    get customers_show,_url
    assert_response :success
  end

  test "should get edit," do
    get customers_edit,_url
    assert_response :success
  end

  test "should get update," do
    get customers_update,_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_destroy_url
    assert_response :success
  end

end
