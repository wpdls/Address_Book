require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end
  test "should get index" do
    get people_path(@address)
    assert_response :success
  end

  test "should get new" do
    get new_person_address_path(@address)
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { street: @address.street, city: @address.city, zip: @address.zip, state: @address.state, country: @address.country, person_id: @address.person_id } }
    end
  end

#my own test
  test "should not save address without requirements" do
    address = Address.new
    assert_not address.save #assert_not ensures that test is false
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
    patch address_url(@address), params: { address: { street: '123 Peach St.', city: 'Prague', zip: 12345, state: 'Cali', country: 'US', person_id: people(:one).id } }
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end
    assert_redirected_to person_path(@address.person_id)
  end

  #ajax testing
  test "address with ajax request" do
    get person_url(@address), xhr: true
  end
  
end

