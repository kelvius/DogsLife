require "test_helper"

class FamilyownersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get familyowners_index_url
    assert_response :success
  end
end
