require "test_helper"

class AmazonBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get convert" do
    get amazon_books_convert_url
    assert_response :success
  end
end
