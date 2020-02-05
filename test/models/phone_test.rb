require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  test "should not save phone without requirements" do
    phone = Phone.new
    assert_not phone.save #assert_not ensures that test is false
  end

end
