# frozen_string_literal: true
require 'capybara/rspec'

class DashboardPage < BasePage

  TABS = {
      :LOANS_ASSIGNED => '.nav-tabs li:nth-child(1)',
  }

  def visit
    @session.visit('/')
  end

  def tabs
    expect_to_have_dashboard
    tab_names = @session.find_all('.nav-tabs li span span:first-child').map(&:text)
    tab_counts = @session.find_all('.nav-tabs li span span:nth-child(2)').map(&:text)
    tab_names.zip(tab_counts)
  end

  def loans
    headers = @session.find_all('.z-header .z-column-header').map(&:text)
    @session.find_all('.loans-datagrid-row').map{|e|
      loan_row = e.find_all('.z-cell').map(&:text)
      Hash[headers.zip(loan_row)]
    }
  end

  def select_tab(tab_name)
    @session.find(TABS[tab_name.to_sym]).click
  end

  private

  def expect_to_have_dashboard
    expect(@session).to have_css('.nav-tabs li span span')
  end


end
