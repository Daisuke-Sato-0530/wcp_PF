require 'test_helper'

class RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rankings_new_url
    assert_response :success
  end

  test "should get create" do
    get rankings_create_url
    assert_response :success
  end

  test "should get show" do
    get rankings_show_url
    assert_response :success
  end

  test "should get index" do
    get rankings_index_url
    assert_response :success
  end

end
