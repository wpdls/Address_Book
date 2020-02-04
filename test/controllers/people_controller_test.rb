require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { salutation: @person.salutation, first_name: @person.first_name, 
        last_name: @person.last_name, middle_name: @person.middle_name, social_security_number: @person.social_security_number,
        bithdate: @person.birthdate, comment: @person.comment} }
    end

    assert_redirected_to people_url
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person), xhr: true
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { salutation: @person.salutation, first_name: @person.first_name, 
      last_name: @person.last_name, middle_name: @person.middle_name, social_security_number: @person.social_security_number,
      bithdate: @person.birthdate, comment: @person.comment} }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
