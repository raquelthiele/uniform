require 'test_helper'

class RequerimentosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get requerimentos_new_url
    assert_response :success
  end

end
