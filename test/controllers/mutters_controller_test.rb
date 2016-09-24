require 'test_helper'

class MuttersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
