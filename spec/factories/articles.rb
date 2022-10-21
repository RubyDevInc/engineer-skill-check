# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'MyString' }
    content { 'MyText' }
    created_at { '2022/10/01' }
  end
end
