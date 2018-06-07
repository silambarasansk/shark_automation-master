SEARCH_ICON_CSS = '.fa.fa-search.search-icon'
SEARCH_FIELD_CSS = '.search-input.form-control.form-control'
SEARCH_ICON_PRESS_CSS = '.search-box-button.btn.btn-primary'

Given(/^I am on loan search page$/) do
  visit('/')
  # if(page.has_title?"Underwriter tool")
  #   puts "opened url is:#{page.current_url}"
  #   puts "successfully correct page is opened"
  # elsif(page.has_title?"404")
  #   puts "opened url is:#{page.current_url}"
  #   puts "page not found"
  # end
end

Then(/^I should see loan search icon at right top of the page$/) do
if(page.find(SEARCH_ICON_CSS))
  puts "search icon is present"
else
  puts "search icon is not present"
end
end
When(/^I mouse hover on search icon$/) do

page.find(SEARCH_ICON_CSS).hover
# page.driver.browser.action.move_to(page.find('.search-box-button.btn.btn-primary').native).perform
end
Then(/^I should see search text field$/) do
  if(page.has_css?(SEARCH_FIELD_CSS))
    puts "search text feild is present"
  else
    puts "search text feild is not present"
  end
end

When(/^I enter less than nine digit value (\d+) in text field$/) do |loan_number|
  page.find(SEARCH_FIELD_CSS).set loan_number
end
Then(/^I should see search icon is disabled$/) do
  if(page.find(SEARCH_ICON_PRESS_CSS).disabled?)

    puts "search icon is disabled"
  else
    puts "search icon is not disabled"
  end
end

When(/^I enter nine and ten digit value (\d+) in text field$/) do |loan_number|
  page.find(SEARCH_FIELD_CSS).set loan_number
end
Then(/^I should see search icon is enabled$/) do
  if(page.find(SEARCH_ICON_PRESS_CSS).disabled?)
    puts "search icon is not enabled"
  else
    puts "search icon is enabled"
  end
end

When(/^I enter valid loan number (\d+) in text field$/) do |loan_number|
  page.find(SEARCH_FIELD_CSS).set loan_number
end

When(/^I press search icon$/) do
  page.find(SEARCH_ICON_PRESS_CSS).click
end

When(/^I press enter button$/) do
  page.find(SEARCH_ICON_PRESS_CSS).native.send_keys(:enter)
end

Then(/^I should see appropriate (\d+) details regardless of the loan being locked or unlocked in Encompass$/) do |loan_number|
  if(page.has_text?(loan_number))
    puts "searched loan #{loan_number} is present in encompass"
  else
    puts "searched loan #{loan_number} is not present in encompass"
  end
end
Then(/^I should see error message "([^"]*)"$/) do |error|
if(page.has_text?(error))
  puts "Invalid loan number"
end
end

Then(/^I should see Loan Does not Exist error message$/) do
  if(page.has_text?("What you are looking for doesn't exist"))
    puts "searched loan doesn't exist in encompass"
  end
end

When(/^I enter invalid loan number (\d+) in text field$/) do |loan_number|
  page.find(SEARCH_FIELD_CSS).set loan_number
end

Then(/^I should see invalid loan error message "([^"]*)"$/) do |error|
if(page.has_text?(error))
  puts "searched loan doesn't exist in encompass"
end
end

Then(/^I should see Encompass down error message "([^"]*)"$/) do |error|
if(page.has_text?(error))
  puts "Encompass is down"
end
end

Then(/^I should see Microservice down error message "([^"]*)"$/) do |error|
if(page.has_text?(error))
  puts "Microservice is down"
end
end


When(/^I enter special alphabet characters (.*) in text field$/) do |alpha_value|
page.find(SEARCH_FIELD_CSS).set alpha_value
end

# Then(/^I should be belocked to enter special alphabet characters$/) do
#   text =page.find(SEARCH_FIELD_CSS).value
#   # puts text
#   if(text == "")
#     puts "alphabets and special characters are not allowed"
#   else
#     puts "alphabets and special characters are allowed"
#   end
# end
