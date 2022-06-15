class ArticlesController < ApplicationController
  before_action :has_news_posting_auth?, only:[:edit,:update,:destroy]
  before_action :my_article?, only:[:edit,:update,:destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.employee = current_user
    if @article.save
      redirect_to articles_path, notice:"新しいお知らせを投稿しました。"
    else
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice:"お知らせ「#{@article.title}」を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice:"お知らせ「#{article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def has_news_posting_auth?
    redirect_to articles_path unless current_user.news_posting_auth
  end

  def my_article?
    article = Article.find(params[:id])
    redirect_to articles_path unless current_user == article.employee
  end

end
