require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should not save person without requirements" do
    person = Person.new
    assert_not person.save #assert_not ensures that test is false
  end

end
