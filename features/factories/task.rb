# frozen_string_literal: true
FactoryGirl.define do
  factory :task do
    description 'Number of units can be 1-4'
    category 'Eligible Properties'
    authorization_type 'AUTO'
    condition_types {
      {
          'Make the following 1003 corrections' => 'UW must provide condition description',
          'Property Profile' => 'Provide Property Profile for:'
      }
    }
    context_info 'desktop publishing packages and web page'
  end
end
