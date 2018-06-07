Given(/^I have the following loans in OODS:$/) do |table|
  loans = table.hashes.map { |loan| FactoryGirl.attributes_for(:loan, loan) }
  OODSService.instance.stub_loans(loans)
end

And(/^I am done setting up data$/) do
  OODSService.instance.save
end

When(/^I am on the dashboard page$/) do
  @dashboardPage = DashboardPage.new
  @dashboardPage.visit
end

Then(/^I should see the following tabs with count:$/) do |table|
  actual_tabs = @dashboardPage.tabs
  expected_tabs = table.hashes.map(&:values)
  expect(actual_tabs).to eq(expected_tabs)
end

When(/^I select the "([^"]*)" tab$/) do |tab_name|
  @dashboardPage.select_tab(tab_name)
end

Then(/^I should see the following loans:$/) do |table|
  loan_rows = @dashboardPage.loans
  expect(loan_rows).to eq(table.hashes)
end

Given(/^I have the following product information for category "([^"]*)" with description "([^"]*)":$/) do |category_name, category_description, table|
  SharkService.new.create_product_information(category_name, category_description, table.hashes)
end

And(/^I have the following tasks for product with code "([^"]*)":$/) do |product_code, table |
  SharkService.new.create_task_information(product_code, table.hashes)
end
