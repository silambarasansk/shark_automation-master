#SHARK-55 => View processor fullfilled tasks
@wip
Feature: View processor fullfilled tasks
  In order to review, prioritize and take action on the Fulfilled Tasks
  As an underwriter
  I should be able to View the icon for Fulfilled Conditions on a Task
  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page

     Scenario Outline: verifying presence of Fulfilled icon for tasks which has fulfilled Conditions
       When I click "IN PROGRESS" bucket
       Then I should see Fulfilled icon for tasks which has fulfilled status for one or more associated Conditions
       Examples:
       |loan number|
       |401371265|

       Scenario Outline: verifying absence of Fulfilled icon for tasks which has no fulfilled Conditions
         When I click "IN PROGRESS" bucket
         Then I should not see Fulfilled icon for tasks which has no fulfilled status for all associated Conditions
         Examples:
         |loan number|
         |401371265|

         Scenario Outline: verifying absence of Fulfilled icon for tasks in other than IN PROGRESS bucket
           When I click "FINAL REVIEW" bucket
           Then I should not see Fulfilled icon for tasks
           When I click "COMPLETED" bucket
           Then I should not see Fulfilled icon for tasks
           When I click "INITIAL REVIEW" bucket
           Then I should not see Fulfilled icon for tasks
           Examples:
           |loan number|
           |401371265|
