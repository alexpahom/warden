require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
  # driven_by :selenium

  def take_failed_screenshot
    false
  end

  def accept_alert
    page.driver.browser.switch_to.alert.accept
  end

  def validate_flash(text)
    within('#flash') { assert page.has_content?(text), 'No success message' }
  end

  def fill_modal_with(text)
    fill_in 'name', with: text
    page.find(:xpath, "//*[contains(@value,'Section') or contains(@value,'Suite')]").click
  end
end
