Feature: Dashboard feature

  @smoke @all
  Scenario: Validating the dashboard with correct loan statuses
    Given I have the following product information for category "FHASS" with description "FHA Streamline Service":
      | code | description               |
      | 100  | FHA 30 Streamline SM SRVR |
    And I have the following tasks for product with code "100":
      | description                | category            | authorization_type | context_info                             |
      | Number of units can be 1-4 | Eligible Properties | AUTO               | desktop publishing packages and web page |
      | Condo ID required          | Eligible Properties | HYBRID             |                                          |

    And I have the following loans in OODS:
      | loanNumber | firstName | lastName   | productCode | productDescription        | lienType | milestoneStatus | lastFinishedMilestone | milestoneDate          |
      | 0401516497 | Saumya    | ServicerCA | CFF010-SF30 | FHA 30 Streamline SM SRVR | FHASS    | 2A              | Processing            | 02/04/2016 01:31:00 AM |
      | 0401505094 | Andy      | Buyer      | CFF010-SF30 | FHA 30 Streamline SM SRVR | FHASS    | 2G              | Approval              | 12/26/2015 11:29:49 PM |
      | 0401504220 | Penny     | Public     | CFF010-SF30 | FHA 30 Streamline SM SRVR | FHASS    | 2F              | Resubmittal           | 12/29/2015 4:14:41 PM  |
    And I am done setting up data

    When I am on the dashboard page
    Then I should see the following tabs with count:
      | tabs              | count |
      | LOANS ASSIGNED    | 3     |

    When I select the "LOANS_ASSIGNED" tab
    Then I should see the following loans:
      | LOAN NUMBER | PRODUCT DESCRIPTION       | MILESTONE STATUS | LAST FINISHED MILESTONE | MILESTONE DATE & TIME | BORROWER NAME     |
      | 0401504220  | FHA 30 Streamline SM SRVR | 2F               | Resubmittal             | 12/29/2015 04:14 PM   | Penny Public      |
      | 0401505094  | FHA 30 Streamline SM SRVR | 2G               | Approval                | 12/26/2015 11:29 PM   | Andy Buyer        |
      | 0401516497  | FHA 30 Streamline SM SRVR | 2A               | Processing              | 02/04/2016 01:31 AM   | Saumya ServicerCA |
