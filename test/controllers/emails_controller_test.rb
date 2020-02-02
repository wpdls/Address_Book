require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
  end

  test "should get new" do
    get new_person_email_path(@email)
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post emails_url, params: { email: { email: 'email@email.com', comment: 'This is a comment', person_id: people(:one).id } }
    end

    assert_redirected_to person_path(people(:one).id)
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
    patch email_url(@email), params: { email: { email: 'email@email.com', comment: 'This is a comment', person_id: '8'  } }
    assert_redirected_to email_url(@email)
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to person_path(@email.person_id)
  end
end
