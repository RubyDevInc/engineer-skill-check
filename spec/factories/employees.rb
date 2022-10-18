# frozen_string_literal: true

FactoryBot.define do
  factory :manager_employee, class: 'Employee' do
    department
    office
    number { '1' }
    last_name { '春樹' }
    first_name { '村上' }
    account { 'murakami' }
    password { 'haruki' }
    email { 'haruki@example.com' }
    date_of_joining { '1991/4/1' }
    employee_info_manage_auth { 'true' }
  end

  factory :normal_employee, class: 'Employee' do
    department
    office
    number { '2' }
    last_name { '漱石' }
    first_name { '夏目' }
    account { 'natsume' }
    password { 'sohseki' }
    email { 'sohseki@example.com' }
    date_of_joining { '1991/4/1' }
    employee_info_manage_auth { 'false' }
  end
end
