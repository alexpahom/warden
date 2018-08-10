require 'test_helper'

class CasesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @suite = suites(:one)
    @case = cases(:one)
    @params = {
      title: 'Created by test',
      template: 'checklist',
      suite_id: @suite.id,
      section_id: @suite.sections.first.id
    }
    @to_delete = [
      cases(:one).id,
      cases(:two).id
    ]
  end

  test 'Can create case' do
    assert_difference 'Case.count', 1, 'Case was not created' do
      post suite_cases_path(@suite), params: { case: @params }, xhr: true
    end
  end

  test 'Can delete case' do
    assert_difference 'Case.count', -1, 'Case was not deleted' do
      delete suite_case_path(@suite, @case), xhr: true
    end
  end

  test 'Can delete several cases' do
    assert_difference 'Case.count', -2, 'Cases were not deleted' do
      delete suite_delete_case_path(@suite), params: { ids: @to_delete }, xhr: true
    end
  end
end
