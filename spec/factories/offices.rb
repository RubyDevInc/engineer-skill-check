# frozen_string_literal: true

FactoryBot.define do
  factory :office do
    name { '東京' }
  end

  factory :office_osaka, class: 'Office' do
    name { '大阪' }
  end
end
