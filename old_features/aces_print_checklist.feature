#SHARK-62 => Approve and print checklist
@smoke_testing
Feature: Approve and print checklist
  In order to upload the checklist in the Encompass efolder/ Filenet for auditing purposes
  As a Underwriter
  I should be able to print the checklist for a loan when all the Tasks are in completed bucket

  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page
   |loan number|
   |0401516497|

   Scenario: verifying presence of print checklist icon
     When all tasks are in Completed bucket
     Then I should see APPROVE AND PRINT CHECKLIST icon
     When all tasks are not in Completed bucket
     Then I should not see APPROVE AND PRINT CHECKLIST icon

   Scenario: verifying functionality of APPROVE AND PRINT CHECKLIST icon
     When I click on APPROVE AND PRINT CHECKLIST icon
     Then system should print the list of Task groups in a PDF file
