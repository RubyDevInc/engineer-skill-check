# frozen_string_literal: true

FactoryBot.define do
  factory :manager_employee, class: 'Employee' do
    department
    office
    number { '1' }
    last_name { 'haruki' }
    first_name { 'murakami' }
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
    last_name { 'sohseki' }
    first_name { 'natsume' }
    account { 'natsume' }
    password { 'sohseki' }
    email { 'sohseki@example.com' }
    date_of_joining { '1991/4/1' }
    employee_info_manage_auth { 'false' }
  end
end
