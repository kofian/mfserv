require 'test_helper'

class RisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @risk = risks(:one)
  end

  test "should get index" do
    get risks_url
    assert_response :success
  end

  test "should get new" do
    get new_risk_url
    assert_response :success
  end

  test "should create risk" do
    assert_difference('Risk.count') do
      post risks_url, params: { risk: { amount_covered: @risk.amount_covered, contribution: @risk.contribution, description: @risk.description, interest_rate: @risk.interest_rate, location: @risk.location, name: @risk.name, situation: @risk.situation } }
    end

    assert_redirected_to risk_url(Risk.last)
  end

  test "should show risk" do
    get risk_url(@risk)
    assert_response :success
  end

  test "should get edit" do
    get edit_risk_url(@risk)
    assert_response :success
  end

  test "should update risk" do
    patch risk_url(@risk), params: { risk: { amount_covered: @risk.amount_covered, contribution: @risk.contribution, description: @risk.description, interest_rate: @risk.interest_rate, location: @risk.location, name: @risk.name, situation: @risk.situation } }
    assert_redirected_to risk_url(@risk)
  end

  test "should destroy risk" do
    assert_difference('Risk.count', -1) do
      delete risk_url(@risk)
    end

    assert_redirected_to risks_url
  end
end
