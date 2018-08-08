require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  def setup
    @case = Case.new(
      title: 'Created by test',
      template: 'checklist',
      suite_id: 10,
      section_id: 4
    )
  end

  test 'Case can be created' do
    assert @case.valid?
  end

  test 'Case must have title' do
    @case.title = ''
    assert_not @case.valid?
  end

  test 'Case title must not be long' do
    @case.title = '1' * 150
    assert_not @case.valid?
  end

  test 'Testcase can be saved' do
    @case.template = 'testcase'
    assert @case.valid?
  end

  test 'Case should have definite template' do
    @case.template = 'asd'
    assert_not @case.valid?
  end
end
