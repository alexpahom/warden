require 'test_helper'

class SuitesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @valid_suite = {
      title: 'Interface Tests',
      description: 'Here are some words about the suite'
    }
    @new_suite = {
      title: 'New Interface Tests',
      description: 'New description'
    }
    @one = Suite.find(20)
  end

  test 'The list of suites is reachable' do
    get suites_path
    assert_response :success
  end

  test 'New suite page is reachable' do
    get new_suite_path
    assert_response :success
  end

  test 'Suite can be created' do
    assert_difference 'Suite.count', 1, 'Test Suite was not created' do
      post suites_path, params: { suite: @valid_suite }
    end
  end

  test 'Show suite page is reachable' do
    get suite_path(@one)
    assert_response :success
  end

  test 'Edit suite page is reachable' do
    get edit_suite_path(@one)
    assert_response :success
  end

  test 'Suite can be edited' do
    patch suite_path(@one), params: { suite: @new_suite }
    assert_equal Suite.find(20).description, @new_suite[:description]
  end

  test 'Suite can be deleted' do
    assert_difference 'Suite.count', -1, 'Test Suite was not deleted' do
      delete suite_path(@one)
    end
  end
end
