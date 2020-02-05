require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  #my own test
  test "should not save address without requirements" do
    address = Address.new
    assert_not address.save #assert_not ensures that test is false
  end
  
end
