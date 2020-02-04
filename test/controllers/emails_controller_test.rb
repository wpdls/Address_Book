require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
    @person = people(:one)
  end

  test "should get index" do
    get people_path(@email)
    assert_response :success
  end

  test "should get new" do
    get new_person_email_path(@email)
    assert_response :success
  end

  test "should create email" do
    @person
    assert_difference('Email.count') do
      post emails_url, params: { email: { email: 'email@email.com', comment: 'This is a comment', person_id: people(:one).id } }
    end
    assert_redirected_to person_path(people(:one).id)
  end

  #my own test
  test "should not save email without requirements" do
    email = Email.new
    assert_not email.save #assert_not ensures that test is false
  end

  test "should show email" do
    get people_path(@email)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_url(@email)
    assert_response :success
  end

  test "should update email" do
    patch email_url(@email), params: { email: { email: 'email@email.com', comment: 'This is a comment', person_id: people(:one).id  } }
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to person_path(@email.person_id)
  end

  #ajax testing
  test "email with ajax request" do
    get person_url(@email), xhr: true
  end

end
