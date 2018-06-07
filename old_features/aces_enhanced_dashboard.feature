#SHARK-157 & 178 => Enhanced Dashboard
@wip
Feature: Enhanced Dashboard
  In order to review the relevant field information and ensure data integrity
  As a Underwriter
  I should be able to View the Related fields and Context Sensitive Help associated with the Tasks

  Background:
   Given I am on loan search page

   Scenario: verifying presence of Ready To Complete ,New and In-Progress Tabs and their functionality
    When I navigate to Dashboard Page
    Then I should see Ready To Complete, New and In-Progress Tabs with appropriate loan count on each Tab
    When click on Ready To Complete Tab
    Then I should see loans having no Tasks in Initial Review and In-Progress buckets
    And loans having one or more tasks in Final Review or Completed buckets
    When click on New Tab
    Then I should see loans having one or more Tasks in the Initial Review bucket
    When click on In-Progress Tab
    Then I should see loans having one or more Tasks in the In-Progress bucket

    Scenario: verifying presence of next / previous hyperlink for each tab when loans count is more than 20
     When I navigate to Dashboard Page
      Then I should see 20 loans per page
     And next / previous hyperlink for each tab
     When I click next hyperlink
     Then I should see next set of available loans
     When I click previous hyperlink
     Then I should see previous set of available loans
