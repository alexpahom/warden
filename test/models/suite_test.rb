require 'test_helper'

class SuiteTest < ActiveSupport::TestCase
  def setup
    @suite = Suite.new(
      title: 'Interface Tests',
      description: 'Here are some words about the suite'
    )
  end

  test 'Suite can be created' do
    assert @suite.valid?
  end

  test 'Title cannot be blank' do
    @suite.title = ''
    assert_not @suite.valid?
  end

  test 'Title should be unique' do
    @suite.title = suites(:one).title
    assert_not @suite.valid?
  end

  test 'Title should not be long' do
    @suite.title = '1' * 141
    assert_not @suite.valid?
  end

  test 'Description should not be long' do
    @suite.description = '1' * 2001
    assert_not @suite.valid?
  end
end
