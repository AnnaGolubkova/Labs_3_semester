require 'test_helper'

class PolinControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end


  test "should get view db" do
    get :view, {v1: 2}
    assert_equal [["0","0"],["1","1"]], assigns[:result]
  end

  test "should get view nil" do
    get :view, {v1: ''}
    assert_equal [], assigns[:result]
  end

  test "should check the equal computing for 10 and 20" do
    get :view, {v1: '10'}
    result_first = assigns[:result]
    get :view, {v1: '20'}
    result_second = assigns[:result]
    assert_equal result_first, result_second
  end

  test "should check the different computing for 10 and 40" do
    get :view, {v1: '10'}
    result_first = assigns[:result]
    get :view, {v1: '40'}
    result_second = assigns[:result]
    assert_not_equal result_first, result_second
  end




end
