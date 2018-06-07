CURRENT_LOAN_CSS = '.current'
PREVIOUS_LOAN_CSS = '.previous'
VIEW_MORE_LABEL_CSS = '.action>p'
VIEW_MORE_ICON_CSS = '.fa.fa-2x.fa-chevron-circle-down'
VIEW_LESS_LABEL_CSS = '.action>p'
VIEW_LESS_ICON_CSS = '.fa.fa-2x.fa-chevron-circle-up'

When(/^I search a (\d+) in search loan page$/) do |loan_number|
  @session=Capybara.current_session
  @search_page = SearchPage.new(@session)
  @search_page.search_loan(loan_number)
end

Then(/^I should see collapsed view of searched loan with view more icon$/) do
  if(@session.has_css?(VIEW_MORE_ICON_CSS))
    puts "view more icon is present"
  else
    puts "view more icon is not present"
  end

    if(@session.has_css?(VIEW_MORE_LABEL_CSS))
      puts "view more label is present"
    else
      puts "view more label is not present"
    end
end

Then(/^I should see current loan and previous loan details of (\d+) in expanded view$/) do |loan_number|
if(@session.has_css?(CURRENT_LOAN_CSS))
    # @session.all(:css, CURRENT_LOAN_CSS).each do |element|
    element_text = @session.first(:css, CURRENT_LOAN_CSS).text
      if(element_text.include? loan_number)
        puts "Current loan #{loan_number} is present"
      else
        puts "Current loan #{loan_number} is not present"
      end
  else
    puts "Current loan portion is not available"
  end
  if(@session.has_css?(PREVIOUS_LOAN_CSS))
      element_text = @session.first(:css, PREVIOUS_LOAN_CSS).text
        if(element_text.include? "NA")
          puts "Previous loan is not present"
        else
          puts "Previous loan #{element_text} is present"
        end
    else
      puts "Previous loan portion is not available"
    end

end

Then(/^I should see expanded view of searched loan with view less icon$/) do
  if(@session.has_css?(VIEW_LESS_ICON_CSS))
    puts "view less icon is present"
  else
    puts "view less icon is not present"
  end

    if(@session.has_css?(VIEW_LESS_LABEL_CSS))
      puts "view less label is present"
    else
      puts "view less label is not present"
    end
end


When(/^I click on view more icon$/) do
  @session.find(VIEW_MORE_ICON_CSS).click
end
When(/^I press view less icon$/) do
  @session.find(VIEW_LESS_ICON_CSS).click
end
