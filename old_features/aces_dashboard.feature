#SHARK-157 : Enhanced Dashboard [V1]
#SHARK-178 : Enhanced Dashboard [V2]
@smoke_testing
Feature: Enhanced Dashboard
 In order to review, prioritize and perform required actions on the loans
 As an Underwriter/ Underwriting Manager/ Executive
 I should be able to view the Dashboard

 Background:
 Given I am on dashboard page

   Scenario Outline: verifying presence elements on default dashboard page
     Then I should see following tabs <tabs> with appropriate loans count
     |tabs|
     |READY TO COMPLETE|
     |NEW|
     |IN PROGRESS|
     And by default "READY TO COMPLETE" tab should be seleceted

   Scenario: verifying tab navigation functionality
     When I select "NEW" tab
     Then I should see loans which have one or more Tasks in the Initial Review bucket
     When I select "IN PROGRESS" tab
     Then I should see loans which have one or more Tasks in the In-Progress bucket
     When I select "READY TO COMPLETE" tab
     Then I should see loans which have one or more tasks in Final Review or Completed buckets
     And which have no Tasks in Initial Review and In-Progress buckets

   Scenario: verifying pagination functionality
     When I select "NEW" tab
     Then I should see next and previous hyper links if loans count is more than 20
     When I click next hyper link
     Then I should see next list of loans available
     When I click previous hyper link
     Then I should see previous list of loans available
     When I select "IN PROGRESS" tab
     Then I should see next and previous hyper links if loans count is more than 20
     When I click next hyper link
     Then I should see next list of loans available
     When I click previous hyper link
     Then I should see previous list of loans available
     When I select "READY TO COMPLETE" tab
     Then I should see next and previous hyper links if loans count is more than 20
     When I click next hyper link
     Then I should see next list of loans available
     When I click previous hyper link
     Then I should see previous list of loans available
