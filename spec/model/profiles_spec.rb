require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { FactoryBot.build(:profile) }

  describe "新規投稿" do
    context "新規投稿成功" do
      it '内容に問題ない場合' do
        expect(profile).to be_valid
      end
    end

    context '新規作成失敗' do
      it '1文字以下では登録できない' do
        profile.profile = ""
        profile.valid?
        expect(profile.errors.full_messages).to include("プロフィール を入力してください")
      end

      it '300文字以上では登録できない' do
        profile.profile = 'a' * 301
        profile.valid?
        expect(profile.errors.full_messages).to include("プロフィール は300文字以内で入力してください")
      end
    end
  end
end
