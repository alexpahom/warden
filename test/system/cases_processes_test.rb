require "application_system_test_case"

class CasesProcessesTest < ApplicationSystemTestCase
  setup do
    @suite = Suite.first
    visit suite_path(@suite)
    @case = 'User have to exist'
    @to_delete = @suite.cases.first
  end

  test 'Can create a case' do
    page.first(:xpath, "//a[@class='link add-case']").click
    fill_in 'case_title', with: @case
    page.find(:xpath, "//input[@type='image']").click
    within(:xpath, "(//table)[1]//*[@class='case-cell'][last()]") do
      assert page.has_content? @case
    end
  end

  test 'Can delete a case' do
    page.find(:xpath, "//tr[@id='case_#{@to_delete.id}']").hover.find(:xpath, "//a[@data-method='delete']").click
    accept_alert
    assert page.has_no_xpath?("//tr[@id='case_#{@to_delete.id}']")
  end
end
