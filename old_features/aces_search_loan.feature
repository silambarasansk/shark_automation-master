#SHARK-50 : Search for a loan
@smoke_testing
Feature: Search loan details
 In order to search a loan
 As an Underwriter/ Underwriting Manager/ Executive
 I should be able to search and view if Loan exists in Encompass

Background:
Given I am on loan search page

   Scenario Outline: verifying Loan search functionality
     Then I should see loan search icon at right top of the page
     When I mouse hover on search icon
     Then I should see search text field
     When I enter nine or ten digit value <loan number> in text field
       |loan number|
       |0401516497|
     When I press search icon or enter button
     Then I should see appropriate <loan number> details regardless of the loan being locked or unlocked in Encompass
       |loan number|
       |0401516497|

   Scenario Outline: verifying UI validations in Loan search page
     When I enter less than nine digit value <less_than_nine_digit> in text field
       |less_than_nine_digit|
       |1234|
     Then I should see search icon is disabled
     When I enter nine and ten digit value <loan number> in text field
      |loan number|
      |401371265|
     Then I should see search icon is enabled
     When I enter special alphabet characters <alpha special> in text field
       |alpha special|
       |asdsffd<>|
     And I press search icon or enter button
     Then I should see error message "The system is not responding, please try again later"
     When I enter invalid loan number <invalid_loan_number> in text field
      |invalid_loan_number|
      |400040004|
     And I press search icon or enter button
     Then I should see invalid loan error message "What you are looking for doesn't exist"

   Scenario Outline: verifying error message in Loan search when Encompass system is down
     When I enter valid loan number <loan number> in text field
       |loan number|
       |4000010001|
     When I press enter button
     Then I should see Encompass down error message "The Encompass system is not responding, please try again later"

   Scenario Outline: verifying error message in Loan search when Microservice is down
     When I enter valid loan number <loan number> in text field
       |loan number|
       |4000010002|
     When I press search icon
     Then I should see Microservice down error message "The Data service is not responding, please try again later"
