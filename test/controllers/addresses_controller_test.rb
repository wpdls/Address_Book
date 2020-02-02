require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get new" do
    get new_person_address_path(@address)
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { street: @address.street, city: @address.city, zip: @address.zip, state: @address.state, country: @address.country, person_id: people(:one).id } }
    end

    assert_redirected_to person_path(people(:one).id)
  end

  test "should show address" do
    get people_path(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_path(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_path(@address), params: { address: { street: @address.street, city: @address.city, zip: @address.zip, state: @address.state, country: @address.country, person_id: people(:one).id } }
    assert_redirected_to person_path(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to person_path(@address.person_id)
  end
end
