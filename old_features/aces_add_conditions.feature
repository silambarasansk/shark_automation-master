#SHARK-57 : Add condition from standard list
@wip
  Feature: Add conditions to tasks
  In order to I can verify documents and ensure consistency in Encompass
  As an Underwriter
  I should be able to add a condition to a task

    Scenario: Adding a new condition
      Given I search a 401371265 in search loan page
      Then I should be able to see all the tasks for the loan
      Given I click on the task
      Then I should be able to see all the details of task
      And I should be able to add a new condition
      Given I add condition "<condition type>" with default description
      Then I should be able to see the added condition with default description
      And I should be able to see "Add condition" card

    Scenario: Adding a new condition with user description
      Given I search a 401371265 in search loan page
      Given I click on the task
      Given I add condition "<condition type>" with "<description>"
      Then I should be able to see the added condition with "<description>"
      And I should be able to see "Add condition" card

    Scenario: Adding a new condition with freeflow type
      Given I search a 401371265 in search loan page
      Given I click on the task
      Given I add freeflow condition "<condition type>" with "<description>"
      Then I should be able to see the added condition with "<description>"
      And I should be able to see "Add condition" card

    Scenario: Adding a new condition when encompasss is down
      Given I search a 401371265 in search loan page
      Given I click on the task
      Given I add "<condition type>" with "<description>"
      Then I should be able to see the error "Condition Not Added - Please try again later"

    Scenario: Adding a new condition when encompasss is not responding
      Given I search a 401371265 in search loan page
      Given I click on the task
      Given I add "<condition type>" with "<description>"
      Then I should be able to see the error " Condition Not Added - Please try again later"
      And I should be able to see "<condition type>" with "<description>" retained

    Scenario: Adding a new condition when loan is locked
      Given I search a 401371265 in search loan page
      Given I click on the task
      Given I add "<condition type>" with "<description>"
      Then I should be able to see the error "Oops! Loan is locked. Condition Not Added - Please try again later"
