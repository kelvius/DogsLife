require "test_helper"

class FamilyOwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get family_owners_index_url
    assert_response :success
  end
end
