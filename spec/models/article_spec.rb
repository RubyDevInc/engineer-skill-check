# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:employee) { FactoryBot.create(:manager_employee) }

  it 'is valid with a id and title, content, employee id' do
    article = described_class.new(
      id: 1,
      title: 'Hello',
      content: 'Hello World',
      employee_id: employee.id
    )
    expect(article).to be_valid
  end

  it 'is invalid without a title' do
    article = described_class.new(title: nil)
    article.valid?
    expect(article.errors[:title]).to include('を入力してください')
  end

  it 'is invalid title length' do
    article = described_class.new(
      id: 1,
      title: '111111111122222222223333333333444444444455555555556',
      content: 'Hello World',
      employee_id: employee.id
    )
    article.valid?
    expect(article.errors[:title]).to include('は50文字以内で入力してください')
  end

  it 'is invalid without a content' do
    article = described_class.new(content: nil)
    article.valid?
    expect(article.errors[:content]).to include('を入力してください')
  end

  it 'is invalid without a employee' do
    article = described_class.new(employee_id: nil)
    article.valid?
    expect(article.errors[:employee]).to include('を入力してください')
  end
end
