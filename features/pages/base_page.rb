# frozen_string_literal: true
class BasePage
  include RSpec::Matchers

  def initialize
    @session = Capybara.current_session
  end
end
