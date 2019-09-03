require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get creae" do
    get favorites_creae_url
    assert_response :success
  end

  test "should get destroy" do
    get favorites_destroy_url
    assert_response :success
  end

end
