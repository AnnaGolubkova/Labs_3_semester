require 'test_helper'

class FactorialControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get factorial_input_url
    assert_response :success
  end

  test "should get view" do
    get factorial_view_url
    assert_response :success
  end

   test 'polindrom_factorial_to_100' do
    get factorial_view_url, params: {v1: 4}
    assert_equal assigns[:result], [['0','0'],['1','1'],['3','11']]
  end

end
