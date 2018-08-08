require "application_system_test_case"

class SectionProcessesTest < ApplicationSystemTestCase
  setup do
    @suite = Suite.first
    visit suite_path(@suite)
    @new_title = 'I\'m a section!'
    @updated_title = 'Updated section'
  end

  test'Can create section' do
    page.click_link('Add Section')
    fill_modal_with @new_title
    validate_flash 'Done'
    within(:xpath, "(//*[@class='section-block'])[last()]") do
      assert page.has_content?(@new_title), 'Section is not created?'
    end
  end

  test 'Can update section' do
    page.first('.section-head').hover.first('.action-hover').click
    fill_modal_with @updated_title
    validate_flash 'Done'
    assert page.has_content?(@updated_title)
  end

  test 'Can create a subsection' do
    subs_number = page.first('.section-block').all('.add-section').count
    page.first('.add-section').click
    fill_modal_with @new_title
    sleep 1
    assert_equal subs_number + 1, page.first('.section-block').all('.add-section').count
  end

  test 'Can delete a section' do
    to_delete = page.first('.section-head').first('span').text
    page.first('.section-head').hover.all('.action-hover').last.click
    accept_alert
    sleep 1
    within('#cases') { assert_not page.has_content?(to_delete) }
  end
end
