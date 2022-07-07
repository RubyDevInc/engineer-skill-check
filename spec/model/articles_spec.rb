require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { FactoryBot.build(:article) }

  describe "新規投稿" do
    context "新規投稿成功" do
      it '内容に問題ない場合' do
        expect(article).to be_valid
      end
    end

    context '新規作成失敗' do
      it 'タイトルが空では登録できない' do
        article.title = ""
        article.valid?
        expect(article.errors.full_messages).to include("タイトル は1文字以上で入力してください")
      end

      it 'タイトルが50文字以上では登録できない' do
        article.title = 'a' * 51
        article.valid?
        expect(article.errors.full_messages).to include("タイトル は50文字以内で入力してください")
      end

      it '内容が空では登録できない' do
        article.content = ""
        article.valid?
        expect(article.errors.full_messages).to include("内容 を入力してください")
      end
    end
  end
end
