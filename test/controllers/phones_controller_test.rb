require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
    @person = people(:one)
  end

  test "should get index" do
    get people_path(@phone)
    assert_response :success
  end

  test "should get new" do
    get new_person_address_path(@phone)
    assert_response :success
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post phones_url, params: { phone: { phone_number: '1234567889', comment: 'This is a comment', person_id: @phone.person_id } }
    end
    assert_redirected_to person_path(people(:one).id)
  end

  test "should show phone" do
    get people_path(@phone)
    assert_response :success
  end

  test "should get edit" do
    get edit_phone_url(@phone)
    assert_response :success
  end

  test "should update phone" do
    patch phone_url(@phone), params: { phone: { phone_number: '1234567889', comment: 'This is a comment', person_id: people(:one).id } }
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete phone_url(@phone)
    end
    assert_redirected_to person_path(@phone.person_id)
  end

  #ajax testing
  test "phone with ajax request" do
    get person_url(@phone), xhr: true
  end
end


