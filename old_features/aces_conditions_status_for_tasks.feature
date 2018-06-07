#SHARK-56 : View status of conditions for tasks
@wip
Feature: View status of conditions for tasks
  In order to perform actions on each conditions associated tasks
  As a Underwriter/ Underwriting Manager/ Executive
  I should be able to View the Conditions and Status of the Conditions for each Task

  Background:
   Given I am on loan search page
   When I search a valid loan number <loan number> in loan search page
     |loan number|
     |401371265|

   Scenario Outline: verifying presents of elements for a Condition
     When I click a task bucket <task_bucket>
       |task_bucket|
       |INITIAL REVIEW|
       |IN PROGRESS|
       |FINAL REVIEW|
       |COMPLETED|
     Then I should see tasks associated to task bucket
     When I click a task from task list
     Then I should see conditions associated to selected task
     And I should see Condition Type, Description and Comments for each condition
     And I should see comments displayed in reverse chronological order and the card view grows to accommodate them

   Scenario Outline: verifying color of each Condition based on Condition status
     When I click a task bucket <task_bucket>
       |task_bucket|
       |INITIAL REVIEW|
       |IN PROGRESS|
       |FINAL REVIEW|
       |COMPLETED|
     Then I should see tasks associated to task bucket
     When I click a task from task list
     Then I should see conditions associated to selected task
     And I should see the conditions color based on Condition status
     And I should see the conditions icon based on it's status

     Scenario Outline: verifying Conditions displaying order based on Condition status
       When I click a task bucket <task_bucket>
         |task_bucket|
         |INITIAL REVIEW|
         |IN PROGRESS|
         |FINAL REVIEW|
         |COMPLETED|
       Then I should see tasks associated to task bucket
       When I click a task from task list
       Then I should see conditions associated to selected task
       And I should see conditions are displayed in the order of Fulfilled, Added, Rejected, Cleared and Waived
