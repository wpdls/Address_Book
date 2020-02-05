require "application_system_test_case"


class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    click_on "Create Person"
  end

  test "updating a Person" do
    visit person_url(@person)
    click_on "edit/add your basic info", match: :first

    click_on "Update Person"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_text "Person was successfully destroyed"
  end
end
