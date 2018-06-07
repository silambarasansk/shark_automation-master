#SHARK-209 : Rules - Triggering the delta movement
@smoke_testing
Feature: Rules - Triggering the delta movement
  In order to ensure changes in Encompass data fields are reflected on Auto and Hybrid tasks
  As an Underwriter/ Underwriting Manager/ Executive
  I want system to run the rules

  Background:
   Given I am on loan search page
   When I search a valid loan number <loan number> in loan search page
     |loan number|
     |0401516497|

   Scenario Outline: verifying delta changes on Auto tasks
     When no conditions are already added to a Auto task
     And Auto task is displayed in Initial Review bucket and rules are failed
     When data got changed in Encompass for the fields which are related to Auto task rules
     Then Auto task should be displayed in Final Review bucket if rules are passed
     When conditions are already added to a Auto task
     And Auto task is displayed in In Progress bucket and rules are failed
     When data got changed in Encompass for the fields which are related to Auto task rules
     Then Auto task should be displayed in In Progress bucket if rules are passed
     When Auto task is displayed in Final Review bucket and rules are passed
     And data got changed in Encompass for the fields which are related to Auto task rules
     Then Auto task should be displayed in Final Review bucket with auto fail indicator if rules are failed
     When Auto task is displayed in Completed bucket and rules are passed
     And data got changed in Encompass for the fields which are related to Auto task rules
     Then Auto task should be displayed in Final Review bucket with auto fail indicator if rules are failed

   Scenario Outline: verifying delta changes on Hybrid tasks
     When no conditions are already added to a Hybrid task
     And Hybrid task is displayed in Initial Review bucket and rules are passed
     When data got changed in Encompass for the fields which are related to Hybrid task rules
     Then Hybrid task should be displayed in Final Review bucket with Not Applicable indicator if rules are failed
     When conditions are already added to a Hybrid task
     And Hybrid task is displayed in In Progress bucket and rules are passed
     When data got changed in Encompass for the fields which are related to Hybrid task rules
     Then Hybrid task should be displayed in In Progress bucket with Not Applicable indicator if rules are failed
     When Hybrid task is displayed in Final Review bucket with Not Applicable indicator and rules are failed
     And data got changed in Encompass for the fields which are related to Hybrid task rules
     Then Hybrid task should be displayed in Final Review bucket with Applicable delta indicator if rules are passed
     When Hybrid task is displayed in Completed bucket and rules are passed
     And data got changed in Encompass for the fields which are related to Hybrid task rules
     Then Hybrid task should be displayed in Completed bucket with Not Applicable indicator if rules are failed
     When Hybrid task is displayed in Completed bucket with Not Applicable indicator and rules are failed
     And data got changed in Encompass for the fields which are related to Hybrid task rules
     Then Hybrid task should be displayed in Final Review bucket with Applicable delta indicator if rules are passed
     
