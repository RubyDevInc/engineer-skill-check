class ArticlesController < ApplicationController

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
      redirect_to articles_path, notice:"お知らせを投稿しました。"
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

  end

  def destroy

  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
