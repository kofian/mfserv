require 'test_helper'

class EquityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equity_type = equity_types(:one)
  end

  test "should get index" do
    get equity_types_url
    assert_response :success
  end

  test "should get new" do
    get new_equity_type_url
    assert_response :success
  end

  test "should create equity_type" do
    assert_difference('EquityType.count') do
      post equity_types_url, params: { equity_type: { description: @equity_type.description, name: @equity_type.name, status: @equity_type.status } }
    end

    assert_redirected_to equity_type_url(EquityType.last)
  end

  test "should show equity_type" do
    get equity_type_url(@equity_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_equity_type_url(@equity_type)
    assert_response :success
  end

  test "should update equity_type" do
    patch equity_type_url(@equity_type), params: { equity_type: { description: @equity_type.description, name: @equity_type.name, status: @equity_type.status } }
    assert_redirected_to equity_type_url(@equity_type)
  end

  test "should destroy equity_type" do
    assert_difference('EquityType.count', -1) do
      delete equity_type_url(@equity_type)
    end

    assert_redirected_to equity_types_url
  end
end
