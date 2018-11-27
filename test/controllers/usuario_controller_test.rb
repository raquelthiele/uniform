require 'test_helper'

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usuario_new_url
    assert_response :success
  end

end
