FactoryBot.define do
  factory :profile do
    profile { 'This is test-profile' }
    association :employee
  end
end
