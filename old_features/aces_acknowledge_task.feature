#SHARK-161 => Acknowledge Task
@smoke_testing
Feature: Acknowledge Task
  In order to move tasks to Final Review which don't need further actions on the same.
  As a Underwriter
  I should be able to move Tasks individually from Initial Review to Final Review

  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page
   |loan number|
   |0401516497|

   Scenario: verifying presence of Acknowledge Task button and it's functionality
    When I click on Initial Review bucket
    And I open or click on one of the displayed tasks
    Then I should see Acknowledge Task button
    When I click on In Progress bucket
    And I click on one of the displayed tasks
    Then I should not see Acknowledge Task button

    Scenario: verifying Acknowledge Task button's functionality
     When I click on Initial Review bucket
     And I click or open on one of the displayed tasks
     Then I should see Acknowledge Task button
     When I click on Acknowledge Task button
     Then I should see "ACKNOWLEDGE action performed on 1 task successfully!"
     When I close acknowledged task
     Then I should see "Moved 1 task from INITIAL REVIEW to FINAL REVIEW"
     Then I should see acknowledged task moved from Initial Review bucket to Final Review bucket
     And I should see updated Task count in both Initial Review bucket and Final Review bucket
