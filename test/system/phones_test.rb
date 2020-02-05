require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  setup do
    @phone = phones(:one)
    @person = people(:one)
  end

  test "creating a Phone" do
    visit person_url(@email)
    click_on "add more phone numbers"

    fill_in "Phone number", with: 12345678

    click_on "Save"
  end

  test "updating a Phone" do
    visit phones_url
    click_on "edit", match: :first

    click_on "Update Phone"
  end

  test "destroying a Phone" do
    visit phones_url
    page.accept_confirm do
      click_on "delete", match: :first
    end
  end
end
