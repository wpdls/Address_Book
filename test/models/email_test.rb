require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  #my own test
  test "should not save email without requirements" do
    email = Email.new
    assert_not email.save #assert_not ensures that test is false
  end
  
end
