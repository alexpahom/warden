require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  def setup
    @section = Section.new(
      title: 'Interface Tests',
      description: 'Here are some words about the section',
      suite_id: 10
    )
  end

  test 'Section can be created' do
    assert @section.valid?
  end

  test 'Title cannot be blank' do
    @section.title = ''
    assert_not @section.valid?
  end

  test 'Title should be unique' do
    @section.title = sections(:one).title
    assert_not @section.valid?
  end

  test 'Title should not be long' do
    @section.title = '1' * 141
    assert_not @section.valid?
  end

  test 'Description should not be long' do
    @section.description = 'a' * 2001
    assert_not @section.valid?
  end

  test 'Sections are destroyed if suite is destroyed' do
    Suite.find(10).destroy
    assert_not Section.find_by(suite_id: 10).present?
  end
end
