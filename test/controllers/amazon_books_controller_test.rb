require "test_helper"

class AmazonBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get convert" do
    get amazon_books_convert_url + "?asin=B0C6993WBQ"
    assert_response :success
  end
end
