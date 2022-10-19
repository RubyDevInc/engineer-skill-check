# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    name { '総務部' }
  end

  factory :department_gizyutu, class: 'Department' do
    name { '技術部' }
  end
end
