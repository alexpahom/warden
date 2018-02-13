require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @suite = suites(:one)
    @section = sections(:one)
    @params = {
      title: 'Created by test',
      description: 'Created by test as well'
    }
    @edit_p = {
      title: 'Updated by test',
      description: 'Updated by test as well'
    }
  end


  test 'New section is reachable' do
    get new_suite_section_path(@suite), xhr: true
    assert_response :success
  end

  test 'Able to create a section' do
    assert_difference 'Section.count', 1, 'Section was not created' do
      post suite_sections_path(@suite), params: { section: @params }, xhr: true
    end
  end

  test 'Edit section is reachable' do
    get edit_suite_section_path(@suite, @section), xhr: true
    assert_response :success
  end

  test 'Update section is available' do
    binding.pry
    patch suite_section_path(@suite, Section.find(4)), params: { section: @edit_p }, xhr: true
    assert_equal Section.find(4).title, @edit_p[:title], 'Section was not updated'
  end

  # TODO: figure out why does this test deletes all the sections of a suite
  # test 'Delete section is available' do
  #   assert_difference 'Section.count', -1, 'Section was not deleted' do
  #     delete suite_section_path(@suite, @section), xhr: true
  #   end
  #   assert @suite.present?, 'Suite has been deleted'
  # end
end
