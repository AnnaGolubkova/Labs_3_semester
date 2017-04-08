require 'test_helper'

class XmlTransformerControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get xml_transformer_input_url
    assert_response :success
  end

end
