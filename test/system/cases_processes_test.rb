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

  # TODO: #<ActionView::Template::Error: undefined local variable or method `section_id' for #<#<Class:0x00007fe07e3f43d0>:0x00000000080c2a30>
  # Did you mean?  @section>
  # /home/alex/warden/app/views/cases/_test_cases.html.haml:5:in `_app_views_cases__test_cases_html_haml___65903224695454033_67447760'
  # test 'Can delete a case' do
  #   page.find(:xpath, "//tr[@id='case_#{@to_delete.id}']").hover.find(:xpath, "//a[@data-method='delete']").click
  #   accept_alert
  #   assert page.has_no_xpath?("//tr[@id='case_#{@to_delete.id}']")
  # end
end
