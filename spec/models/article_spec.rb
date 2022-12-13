require 'rails_helper' # 設定ファイルrails_helper.rbを読み込むコードが全テストにあります

RSpec.describe Article, type: :model do
  it "記事を投稿した時、バリデーションを通ること（タイトルが一文字以上、50文字以下）" do
    article = Article.new(
            title:  "最初の記事",
            content: "初めて投稿しました"
    )
    expect(article).to be_valid
  end
  it "記事を投稿した時、バリデーションを通らないこと（タイトルが一文字以上、50文字以下）" do
    article = Article.new(
            title:  "",
            content: "初めて投稿しました"
    )
    expect(article).to be_invalid
  end

end