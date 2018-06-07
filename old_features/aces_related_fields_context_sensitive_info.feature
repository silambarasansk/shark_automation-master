#SHARK-53 => View related fields and info
#SHARK-52 => View context sensitive help
@smoke_testing

Feature: View related fields and info
  In order to review, prioritize and perform required actions on the loans
  As a Underwriter
  I should be able to view the Dashboard

  Background:
   Given I am on loan search page
   When I search a <loan number> in search loan page
   Examples:
   |loan number|
   |401371265|

    Scenario: verifying presence of Related Information or Context Sensitive Help and Related fields
      When I click on a task which got only Related Fields configured
      Then I should see only Related Fields section with appropriate Data fields then Expected and Actual values
      When I click on a task which got only Related Information or Context Sensitive Help configured
      Then I should see only the Related Information or Context Sensitive Help section
      When I click a task which got both Related Fields and Related Information or Context Sensitive Help configured
      Then I should see Related Fields section with appropriate Data fields then Expected and Actual values followed by Related Information or Context Sensitive Help

    Scenario: verifying presence of Rules status indiator
      When I click on a task which got Related Fields configured
      And Rules are failed
      Then I should see failed indicator in red color at appropriate Data Field
      And I should see Failed tag at top of the task page
      When I click on a task which got Related Fields configured
      And Rules are passed
      Then I should see passed indicator in green color at appropriate Data Field
