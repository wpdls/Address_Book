require "application_system_test_case"

class EmailsTest < ApplicationSystemTestCase
  setup do
    @email =  emails(:one)
    @person = people(:one)
  end

  test "creating an Email" do
    visit person_url(@email)
    click_on "add more emails"

    fill_in "Email", with: "email@email.com"
 
    click_on "Save"
  end

  test "updating an Email" do
    visit emails_url
    click_on "edit", match: :first

    click_on "Update Email"
  end

  test "destroying an Email" do
    visit emails_url

    page.accept_confirm do
      click_on "delete", match: :first
    end
  end
end
