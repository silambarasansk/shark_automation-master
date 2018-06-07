#SHARK-224 => Restrict Action on Tasks across Buckets
@smoke_testing

Feature: Restrict Action on Tasks across Buckets
  In order to ensure that no fluid movement of Tasks
  As a Underwriter
  I should be able to Acknowledge and Approve tasks in specific buckets

  Background:
    Given I am on loan search page
    When I search a <loan number> in search loan page
    Examples:
    |loan number|
    |401371265|

  Scenario: verifying presence of Acknowledge bucket
    When I click on Initial Review bucket
    And I click on a task
    Then I should see Acknowledge Task button
    When I click on In Progress bucket
    And I click on a task
    Then I should not see Acknowledge Task button
    When I click on Final Review bucket
    And I click on a task
    Then I should not see Acknowledge Task button
    When I click on Completed bucket
    And I click on a task
    Then I should not see Acknowledge Task button

    Scenario: verifying presence of Acknowledge bucket
      When I click on Initial Review bucket
      Then I should not see Move Tasks to Complete button
      And I should not see a Tick icon at each task level
      When I click on a task
      Then I should not see Move Task to Complete button
      When I click on In Progress bucket
      Then I should not see Move Tasks to Complete button
      And I should not see a Tick icon at each task level
      When I click on a task
      Then I should not see Move Task to Complete button
      When I click on Final Review bucket
      Then I should see Move Tasks to Complete button
      And I should see a Tick icon at each task level
      When I click on a task
      Then I should see Move Task to Complete button
      When I click on Completed bucket
      Then I should not see Move Tasks to Complete button
      And I should not see a Tick icon at each task level
      When I click on a task
      Then I should not see Move Task to Complete button
