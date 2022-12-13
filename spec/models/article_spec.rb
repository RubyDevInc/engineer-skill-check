require 'rails_helper' # 設定ファイルrails_helper.rbを読み込むコードが全テストにあります

RSpec.describe Article, type: :model do
  it "記事を投稿した時、タイトルが一文字以上、50文字以下であること" do
    article = Article.new(
            title:  "侍",
            content: "太郎"
    )
    expect(article.title).to eq "侍"
  end
end