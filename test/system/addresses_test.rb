require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
    @person = people(:one)
  end

  test "creating an Address" do
    visit person_url(@email)
    click_on "add more addresses"

    fill_in "Street", with: "123 Street"
    fill_in "City", with: "Prague"
    fill_in "Zip", with: 123
    fill_in "Country", with: "United States"

    click_on "Save"
  end

  test "updating an Address" do
    visit addresses_url
    click_on "edit", match: :first

    click_on "Update Address"
  end

  test "destroying an Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "delete", match: :first
    end
  end
end


# sample:
# test "creating new post" do
#   visit new_post_url
#   assert selector "h1", text: "New Post"

#   body = 'This is my test post'
#   fill_in 'post[body]', with: body
#   click_button 'Create Post'

#   assert_text body
# end