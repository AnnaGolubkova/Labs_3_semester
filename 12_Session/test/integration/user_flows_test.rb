require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'registration and calculation'do
    get root_path
    assert_redirected_to controller: 'session', action: 'new'

    follow_redirect!
    assert_select 'a[href="/signup"]'

    get signup_path
    assert_response :success

    post create_user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'sqrt', action: 'input'

    follow_redirect!
    get sqrt_approx_path, params: { v1: 2 }
    assert_equal [["0","0"],["1","1"]], assigns[:result]
  end

  test 'entry and calculation'do
    user = User.new({ login: 'login', password: 'password' })
    assert user.save_new_user

    get root_path
    assert_redirected_to controller: 'session', action: 'new'

    follow_redirect!
    assert_select 'a[href="/signup"]'

    post session_path, params: { session:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'sqrt', action: 'input'

    get sqrt_approx_path, params: { v1: 1 }
    assert_equal [["0","0"]], assigns[:result]
  end

  test 'should not get to calculate without login'do
    get root_path
    assert_redirected_to controller: 'session', action: 'new'

    get sqrt_approx_path, params: { a: rand(1e+6) / 1e+3 }
    assert_redirected_to controller: 'session', action: 'new'

    get sqrt_approx_path, params: { a: 0 }
    assert_redirected_to controller: 'session', action: 'new'
  end

  test 'registration and walk thru pages'do
    get root_path
    assert_redirected_to controller: 'session', action: 'new'

    follow_redirect!
    assert_select 'a[href="/signup"]'

    get signup_path
    assert_response :success

    post create_user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'sqrt', action: 'input'

    follow_redirect!
    get sqrt_approx_path, params: { a: rand(1e+6) / 1e+3 }
    assert_response :success

    get user_path
    assert_response :success

    get users_path
    assert_response :success

    get user_edit_path
    assert_response :success

    post user_path, params: { user:{ login: 'login', password: 'password' } }
    assert_redirected_to controller: 'users', action: 'show'

    get destroy_user_path
    assert_redirected_to root_path
  end
end
