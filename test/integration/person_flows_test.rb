require 'test_helper'

class PersonFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    @phone = phones(:one)
    @email = emails(:one)
    @address = addresses(:one)
  end

  test "can see the home page" do
    get "/people"
    assert_select "h1", "People"
  end

  test "can create a person" do
    get "/people/new"
    assert_response :success

    post "/people",
    params: { person: { first_name: 'First', last_name: 'Last' }, phone: { phone_number: 123455678 }, 
      email: { email: 'email@email.com' } , address: {street: 'Street', city: 'City', zip: 1234, country: 'US'} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "td", "First Last"
  end

  test "can edit a person's info with ajax" do
    get person_url(@person)

    get edit_person_url(@person), xhr: true
    assert_response :success
  end

  test "can edit a person's phone with ajax" do
    get person_url(@person)

    get edit_phone_url(@person), xhr: true
    assert_response :success
  end

  test "can delete a person's phone with ajax" do
    get person_url(@person)

    assert_difference('Phone.count', -1) do
      delete phone_url(@phone), xhr: true
    end
  end
    
  test "can add a phone number with ajax" do
    get person_url(@person)

    assert_difference('Phone.count') do
      post phones_url, params: { phone: { phone_number: '1234567889', comment: 'This is a comment', person_id: @phone.person_id } }
    end
  end

  test "can edit a person's address with ajax" do
    get person_url(@person)

    get edit_address_url(@person), xhr: true
    assert_response :success
  end

  test "can edit a person's email with ajax" do
    get person_url(@person)

    get edit_email_url(@person), xhr: true
    assert_response :success
  end
  


end
