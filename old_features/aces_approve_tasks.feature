#SHARK-61 => Approve tasks
@smoke_testing
Feature: Approve tasks
  In order to move the Tasks to Completed bucket
  As a Underwriter
  I should be able to Approve individual Tasks / Approve All Tasks

  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page
   |loan number|
   |0401516497|

  Scenario: verifying presence of Move tasks to complete button and it's functionality
    When I click on Final Review bucket
    Then I should see Move Tasks to Complete button
    When I click on Move Tasks to Complete button
    Then I should see "APPROVE action performed on n task successfully!"
    #n = appropriate tasks count. example: n = 10 or 25
    And I should see all tasks moved from Final Review bucket to Completed bucket
    And I should see updated Task count in both Final Review bucket and Completed bucket

  Scenario: verifying presence of Move task to complete button and it's functionality
     When I click on Final Review bucket
     And I open or click on one of the displayed tasks
     Then I should see Move Task to Complete button
     When I click on Move Task to Complete button
     Then I should see "APPROVE action performed on 1 task successfully!"
     When I close acknowledged task
     Then I should see approved task moved from Final Review bucket to Completed bucket
     And I should see "Moved 1 task from FINAL REVIEW to COMPLETED"
     And I should see updated Task count in both Final Review bucket and Completed bucket

 Scenario: verifying presence of Tick icon and it's functionality
    When I click on Final Review bucket
    Then I should see Tick icon for each task
    When I click on Tick icon
    Then I should see "APPROVE action performed on 1 task successfully!"
    And I should see that task moved from Final Review bucket to Completed bucket
    And I should see updated Task count in both Final Review bucket and Completed bucket
