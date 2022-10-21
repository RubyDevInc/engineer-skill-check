# frozen_string_literal: true

require 'rails_helper'

describe 'Articles', js: true, type: :system do
  describe 'article index' do
    let(:manager_employee) { FactoryBot.create(:manager_employee) }
    let(:normal_employee) { FactoryBot.create(:normal_employee) }

    before do
      FactoryBot.create(:department_gizyutu)
      FactoryBot.create(:office_osaka)
      FactoryBot.create(:article, employee: manager_employee)
      visit login_path
      fill_in 'employees_account', with: login_employee.account
      fill_in 'employees_password', with: login_employee.password
      click_button 'ログイン'
    end

    context 'when authorized employee is logged in' do
      let(:login_employee) { manager_employee }

      it 'article index appear' do
        click_link 'お知らせ'
        expect(page).to have_content 'MyString'
        expect(page).to have_content '2022/10/01'
        expect(page).to have_content '編集'
        expect(page).to have_content '削除'
        click_link 'MyString'
        expect(page).to have_content 'MyText'
        expect(page).to have_content '編集'
        expect(page).to have_content '削除'
      end
    end

    context 'when normal employee is logged in' do
      let(:login_employee) { normal_employee }

      it 'article index appear' do
        click_link 'お知らせ'
        expect(page).to have_content 'MyString'
        expect(page).to have_content '2022/10/01'
        expect(page).to_not have_content '編集'
        expect(page).to_not have_content '削除'
        click_link 'MyString'
        expect(page).to have_content 'MyText'
        expect(page).to_not have_content '編集'
        expect(page).to_not have_content '削除'
      end
    end
  end
end
