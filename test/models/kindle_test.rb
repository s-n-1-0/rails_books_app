require "test_helper"

class KindleTest < ActiveSupport::TestCase
  def setup
    @kindle = kindles(:onepiece106)
  end
  test "should be valid" do
    assert @kindle.valid?
  end
end
