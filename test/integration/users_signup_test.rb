require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid form submission" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",email: "user@invalid",password:"hello", password_confirmation: "dasdsa"}}
      end
    assert_template "users/new"
    end

    test "valid form submission" do
      get signup_path
      assert_difference 'User.count' do
        post users_path, params: { user: { name: "ramen",email: "user1@valid.com",
        password:"qwerty", password_confirmation: "qwerty"}}
        end
      follow_redirect!
      # assert_template "users/show"
      # assert is_logged_in?
    end  

end
