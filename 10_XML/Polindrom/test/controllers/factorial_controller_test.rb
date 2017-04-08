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

  test 'result should be 101' do
    get '/factorial/view', params: { v1: 300 }
    assert_equal "101", assigns[:result][3][1]
  end

  test 'should correct format xml to hash' do
    get '/factorial/view.xml', params: { v1: 300}
    answer = {
      'hash' => {
        'result' => {
          'description' => 'Result',
          'type' => 'Array', 
          'value' => assigns[:result]
          },
          'text' => {
            'description' => 'Auto translating strings',
            'decimal' => { 'type' => 'String', 'value' => 'decimal' },
            'binary' => { 'type' => 'String', 'value' => 'binary' },
            'repeatcalculation' => { 'type' => 'String', 'value' => 'repeat_calculation' }
          }
      }
    }
    assert_equal answer, Hash.from_xml(response.body)
  end


end
