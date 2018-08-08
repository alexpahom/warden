require 'application_system_test_case'

class SuitesProcessesTest < ApplicationSystemTestCase

  setup do
    @new_suite_title = 'Blackberry Interface Tests'
    @updated_title = 'Updated Suite Title'
    @suite = Suite.first
  end

  test 'Can get to suite creation page' do
    visit suites_path
    click_link('Add Test Suite')
    assert_equal 'Add Test Suites', page.find(:xpath, "//*[@id='section-header']/p").text,
                 'Taken to wrong page?'
  end

  test 'Can create a suite' do
    visit new_suite_path
    fill_modal_with @new_suite_title
    validate_flash 'Done'

    within(:xpath, "(//*[@class='cell'])[last()]") do
      assert page.has_content?(@new_suite_title), 'New suite is not displayed'
    end

    assert page.find_link('Add Test Suite'), 'Taken to wrong page?'
  end

  test 'Can get to edit suite page' do
    visit suites_path
    within(:xpath, "//*[@class='cell'][1]") { click_link('Edit') }
    assert_equal 'Edit Test Suites', page.find(:xpath, "//*[@id='section-header']/p").text,
                 'Taken to wrong page?'
  end

  test 'Can edit a suite' do
    visit edit_suite_path(@suite)
    fill_modal_with @updated_title
    validate_flash 'Done'
    assert page.has_content?(@updated_title), 'Title was not saved'
  end

  test 'Can delete a suite' do
    assert_difference 'Suite.count', -1, 'Did not delete suite' do
      visit edit_suite_path(@suite)
      page.find_link('Delete this test suite').click
      accept_alert
      validate_flash 'Deleted'
    end
  end

  test 'Can open a suite' do
    visit suites_path
    within(:xpath, "//*[@class='cell'][1]") { page.find('.suite-title a').click }
    assert page.has_css?('.label')
  end

  test 'Can return from new/edit suite pages' do
    [new_suite_path, edit_suite_path(@suite)].each do |path|
      visit path
      click_link 'Cancel'
      assert_equal 'Test Suites', page.find(:xpath, "//*[@id='section-header']/p").text,
                   'Taken to wrong page?'
    end
  end
end
