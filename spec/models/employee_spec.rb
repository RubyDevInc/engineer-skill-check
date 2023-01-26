require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'positive for signin' do
    # 必須項目を有効であること
    it 'is valid with ' do
      employee = FactoryBot.build(:employee)
      expect(employee).to be_valid
    end
  end

  describe 'negative for signin' do
    #
  end
end
