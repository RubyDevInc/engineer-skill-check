# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:employee) { FactoryBot.create(:manager_employee) }

  it 'is valid with a id and employee id, profile' do
    profile = described_class.new(
      id: 1,
      employee_id: employee.id,
      profile: 'Hello, World!'
    )
    expect(profile).to be_valid
  end

  it 'is invalid without a employee id' do
    profile = described_class.new(employee_id: nil)
    profile.valid?
    expect(profile.errors[:employee]).to include('を入力してください')
  end

  it 'is invalid without a profile' do
    profile = described_class.new(profile: nil)
    profile.valid?
    expect(profile.errors[:profile]).to include('を入力してください')
  end
end
