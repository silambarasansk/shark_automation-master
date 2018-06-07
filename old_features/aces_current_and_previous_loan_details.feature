#SHARK-45 : View current loan details (data comes from Encompass)
#SHARK-46 : View previous loan details (data comes from SODS)
@smoke_testing
Feature: Current loan and Previous loan details
  In order to view current and previous loan details
  As an Underwriter/ Underwriting Manager/ Executive
  I should be able to search and view if Loan exists in Encompass.

 Background:
  Given I am on loan search page
  When I search a valid loan number <loan number> in loan search page
    |loan number|
    |0401516497|

  Scenario Outline: verifying default collased view of Loan details in loan search page
    Then I should see collapsed view of searched loan with LOAN DETAILS icon

  Scenario Outline: verifying expanded view of Loan details in loan search page
    When I click on LOAN DETAILS icon
    Then I should see expanded view of searched loan with LOAN DETAILS icon

  Scenario Outline: verifying current loan and previous loan details in searched loan page
    When I click on LOAN DETAILS icon
    Then I should see current loan and previous loan details of searched loan number <loan number> in expanded view
    And I should see loan information and financial information with proper alignment

  Scenario Outline: verifying functionality of changing expanded view to collapsed view
    When I click on LOAN DETAILS icon
    Then I should see expanded view of searched loan with LOAN DETAILS icon
    When I click on LOAN DETAILS icon
    Then I should see collapsed view of searched loan with LOAN DETAILS icon
