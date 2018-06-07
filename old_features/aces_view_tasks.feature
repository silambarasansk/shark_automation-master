#SHARK-47 : View tasks based on status ( Buckets)
#SHARK-48 : View tasks with Rules (Auto and Hybrid tasks)
#SHARK-156 : View tasks without rules(Manual and Informational tasks)
#SHARK-181 : View Information Tasks
@smoke_testing
Feature: View tasks with rules and without rules
  In order to work on the tasks
  As an Underwriter/ Underwriting Manager/ Executive
  I want to review manual and system executed tasks and know the applicable tasks associated to a product

  Background:
   Given I am on loan search page
   When I search a valid loan number <loan number> in loan search page
     |loan number|
     |0401516497|

   Scenario Outline: verifying presence of task buckets with tasks count
     Then I should see following task buckets <task_buckets> with appropriate tasks count
     |task_buckets|
     |INITIAL REVIEW|
     |IN PROGRESS|
     |FINAL REVIEW|
     |COMPLETED|
     And by default INITIAL REVIEW bucket should be selected


   Scenario Outline: verifying COMPLETED bucket navigation and appropriate tasks in detail
     When I click COMPLETED bucket
     Then I should see applicable tasks in COMPLETED bucket and task count should match available tasks


    Scenario Outline: verifying FINAL REVIEW bucket navigation and appropriate tasks in detail
      When I click FINAL REVIEW bucket
      Then I should see applicable tasks in FINAL REVIEW bucket and task count should match available tasks


    Scenario Outline: verifying IN PROGRESS bucket navigation and appropriate tasks in detail
      When I click IN PROGRESS bucket
      Then I should see applicable tasks in IN PROGRESS bucket and task count should match available tasks


    Scenario Outline: verifying INITIAL REVIEW bucket navigation and appropriate tasks in detail
      When I click INITIAL REVIEW bucket
      Then I should see applicable tasks in INITIAL REVIEW bucket and task count should match available tasks

    Scenario Outline: verifying Manual tasks
      When no conditions are already added to a Manual task
      Then Manual task should be displayed in Initial Review bucket
      When conditions are already added to a Manual task
      And one or more conditions are with Added or Fulfilled or Cleared or Waived or Rejected status for a Manual task
      Then Manual task should be displayed in In-Progress bucket
      When all conditions are with Cleared or Waived status for a Manual task
      Then Manual task should be displayed in Final Review bucket

    Scenario Outline: verifying Informational tasks
      Then Informational tasks should be displayed in Final Review bucket

    Scenario Outline: verifying Auto tasks
      When no conditions are already added to a Auto task
      Then Auto task should be displayed in Initial Review bucket with the failed indicator if rules are failed
      And Auto task should be displayed in Final Review bucket if rules are passed
      When conditions are already added to a Auto task
      And one or more conditions are with Added or Fulfilled or Cleared or Waived or Rejected status for a Auto task
      Then Auto task should be displayed in In-Progress bucket
      When all conditions are with Cleared or Waived status for a Auto task
      Then Auto task should be displayed in Final Review bucket

    Scenario Outline: verifying Hybrid tasks
      When no conditions are already added to a Hybrid task
      Then Hybrid task should be displayed in Final Review bucket with not applicable indicator if rules are failed
      And Hybrid task should be displayed in Initial Review bucket if rules are passed
      When conditions are already added to a Hybrid task
      And one or more conditions are with Added or Fulfilled or Cleared or Waived or Rejected status for a Hybrid task
      Then Hybrid task should be displayed in In-Progress bucket
      When all conditions are with Cleared or Waived status for a Hybrid task
      Then Hybrid task should be displayed in Final Review bucket
