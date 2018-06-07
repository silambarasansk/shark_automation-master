# frozen_string_literal: true
FactoryGirl.define do
  factory :loan do
    sequence(:loanNumber, 803_000, &:to_s)
    firstName Faker::Name.first_name
    lastName Faker::Name.last_name
    productCode 'CFF010-SF30'
    productDescription 'FHA 30 Streamline SM SRVR'
    lienType 'FHASS'
    milestoneStatus '002'
    milestoneSubStatus 'A'
    lastFinishedMilestone 'Processing'
    milestoneDate '02/04/2016 0131:00 AM'
    addedCount '0.0000000000'
    allCount '0.0000000000'
    clearedCount '0.0000000000'
    fulfilledCount '0.0000000000'
    rejectedCount '0.0000000000'
    waivedCount '0.0000000000'
  end
end
