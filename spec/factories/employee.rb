FactoryBot.define do
  factory :employee do
    account {"testuser"}
    password { 'hogehoge' }
    number {1}
    last_name {'Test'}
    first_name {'Test'}
    sequence(:email) { |n| "testuser#{n}@test.com" }
    date_of_joining {'Mon, 01 Apr 1991'}
    office {Office.new}
    department {Department.new}
  end
end
