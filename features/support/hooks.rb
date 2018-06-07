# frozen_string_literal: true

Before do
  is_selenium = Capybara.page.driver.is_a?(Capybara::Selenium::Driver)
  Capybara.page.driver.browser.manage.window.resize_to(1280, 768) if is_selenium
end
