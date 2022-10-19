# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'is valid with a name' do
    department = described_class.new(
      name: '総務部'
    )
    expect(department).to be_valid
  end

  it 'is invalid without a department name' do
    department = described_class.new(name: nil)
    department.valid?
    expect(department.errors[:name]).to include('を入力してください')
  end
end
