#SHARK-162 : Filters on Tasks
#SHARK-251 : FHASS - Tasks for 6 categories
@smoke_testing
Feature: View tasks based on task category or filter
  In order to group all Tasks associated with a Category and review
  As an Underwriter/ Underwriting Manager/ Executive
  I want to Filter the Loan Tasks by Category

  Background:
   Given I am on loan search page
   When I search a valid loan number <loan number> in loan search page
     |loan number|
     |0401516497|

   Scenario Outline: verifying presence of Task Categories
     Then I should see following Task Categories <task_categories>
      |task_categories|
      |Assets and Reserves|
      |Borrower Eligibility and Credit Requirements|
      |Eligible Properties|
      |FHA Requirements|
      |HPML and HPCT|
      |Income|
      |Max Loan Amount|
      |Net Tangible Benefit|
      |Seasoning Requirements|
      |Title|

   Scenario: verifying Filters functionality
    Given I am on one of the task buckets and which have tasks of multiple categories
    When I click on one of the filters or Task Categories
    Then I should be able to view only tasks for that particular task category
    When I click on clear filter
    Then I should view all the tasks in the original order

   Scenario: verifying Filter replacement from one task category to another within same task bucket
     Given I am on one of the task buckets and which have tasks of multiple categories
     When I click on one of the filters or Task Categories
     Then I should be able to view only tasks of that particular task category
     When I click on another Filter or task category on the list
     Then I should be able to view only tasks of new filter or task category

   Scenario: verifying Filter retention from one task bucket to another
     Given I am on Initial Review bucket and which have tasks of multiple categories
     When I click on one of the filters or Task Categories
     Then I should be able to view only tasks of that particular task category in Initial Review bucket
     When I click on In progress bucket
     Then Filter should get retained In progress bucket
     And I should be able to view only tasks of already filtered task category in In progress bucket
     When I click on Final Review bucket
     Then I should be able to view only tasks of already filtered task category in Final Review bucket
     When I click on Completed bucket
     Then I should be able to view only tasks of already filtered task category in Completed bucket
