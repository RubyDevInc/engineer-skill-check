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

      it 'edit article' do
        click_link 'お知らせ'
        click_link '編集'
        fill_in 'article_title', with: 'MyTitle'
        fill_in 'article_content', with: 'MyContent'
        click_button '更新'
        expect(page).to have_content '「MyTitle」を更新しました。'
      end

      it 'create article' do
        click_link 'お知らせ'
        click_link '新規追加'
        fill_in 'article_title', with: 'MyNumber'
        fill_in 'article_content', with: 'MyNumberを提出してください'
        click_button '保存'
        expect(page).to have_content '「MyNumber」を作成しました。'
      end

      it 'appear validation title' do
        click_link 'お知らせ'
        click_link '新規追加'
        fill_in 'article_title', with: ''
        click_button '保存'
        expect(page).to have_content 'タイトル を入力してください'
      end

      it 'appear validation title length' do
        click_link 'お知らせ'
        click_link '新規追加'
        fill_in 'article_title', with: '111111111122222222223333333333444444444455555555556'
        click_button '保存'
        expect(page).to have_content 'タイトル は50文字以内で入力してください'
      end

      it 'delete article' do
        click_link 'お知らせ'
        click_link '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '「MyString」を削除しました。'
      end
    end

    context 'when normal employee is logged in' do
      let(:login_employee) { normal_employee }

      before do
        FactoryBot.create(:article, title: '検索機能', created_at: '2022/10/31', employee: manager_employee)
      end

      it 'article index appear' do
        click_link 'お知らせ'
        expect(page).to have_content 'MyString'
        expect(page).to have_content '2022/10/01'
        expect(page).not_to have_content '編集'
        expect(page).not_to have_content '削除'
        click_link 'MyString'
        expect(page).to have_content 'MyText'
        expect(page).not_to have_content '編集'
        expect(page).not_to have_content '削除'
      end

      it 'search article' do
        click_link 'お知らせ'
        fill_in 'q_title_cont', with: '検索機能'
        click_button '検索'
        expect(page).not_to have_content 'MyString'
        expect(page).to have_content '検索機能'
      end

      it 'sort created_at article' do
        click_link 'お知らせ'
        expect(all('tbody tr')[0]).to have_content '2022/10/01'
        click_link '公開日'
        click_link '公開日'
        expect(all('tbody tr')[1]).to have_content '2022/10/01'
      end
    end
  end
end
