#SHARK-51 => Capture Notes
#SHARK-54 => View Notes
@smoke_testing
Feature: Capture Notes and View Notes
  In order to add and view required context for a loan
  As an underwriter / Underwriting Manager and other users as well
  I should be able to Capture Notes for a Loan and view the same at any given point of time

  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page
   |loan number|
   |0401516497|

   Scenario: verifying presence of Notes icon and it's functionality
     Then I should see floating Notes icon at right side of loan details page
     And by default the Notes section should be in collapsed view
     When I click on Notes icon
     Then I should see Notes section with a Text Area with Tick icon
     And Text Area with "Enter your notes ..." Label
     And Tick icon should be disabled
     When I enter Notes in text area
     Then Tick icon should be enabled
     When I click on Tick icon
     Then I should see successfully saved Notes with User Name and Timestamp
     When I enter Notes in text area and click on close Notes or X icon
     Then I should see successfull discard of Notes entered by User
     And I should see Notes section is closed and displaying in collapsed view

   Scenario: verifying presence of already captured Notes
     When I click on Notes icon
     Then I should see already captured Notes for a loan in the reverse chronological order
     And I should see existing Notes with appropriate User Name and Timestamp
