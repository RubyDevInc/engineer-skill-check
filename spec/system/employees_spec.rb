# frozen_string_literal: true

require 'rails_helper'

describe 'Employees', js: true, type: :system do
  describe 'employees index' do
    before do
      FactoryBot.create(:manager_employee)
      FactoryBot.create(:normal_employee)
    end

    context 'when authorized employee is logged in' do
      before do
        visit login_path
        fill_in 'employees_account', with: 'murakami'
        fill_in 'employees_password', with: 'haruki'
        click_button 'ログイン'
      end

      it 'create button appear' do
        expect(page).to have_content '新規追加'
      end

      it 'delete button appear' do
        expect(page).to have_content '削除'
      end

      it 'edit button appear' do
        expect(page).to have_content '編集'
      end
    end

    context 'when employee is logged in' do
      before do
        visit login_path
        fill_in 'employees_account', with: 'natsume'
        fill_in 'employees_password', with: 'sohseki'
        click_button 'ログイン'
      end

      it 'delete button not appear' do
        expect(page).to have_no_content '削除'
      end

      it 'edit button not appear' do
        expect(page).to have_no_content '編集'
      end

      it 'create button not appear' do
        expect(page).to have_no_content '新規追加'
      end
    end
  end
end
