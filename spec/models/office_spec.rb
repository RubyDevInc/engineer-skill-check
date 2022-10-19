# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office, type: :model do
  it 'is valid with a name' do
    office = described_class.new(
      name: '東京'
    )
    expect(office).to be_valid
  end

  it 'is invalid without a office name' do
    office = described_class.new(name: nil)
    office.valid?
    expect(office.errors[:name]).to include('を入力してください')
  end
end
