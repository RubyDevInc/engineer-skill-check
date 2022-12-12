RSpec.describe "Article", type: :model do
  it "記事作成時にタイトルのバリデーションを満たすこと（1文字以上、50文字以下）" do
    article = Article.new(
          title:  "侍",
          content: "太郎"
    )
    expect(article).to be_valid
  end
end