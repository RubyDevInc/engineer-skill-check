class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)

  def index
    @articles = Article.all.page(params[:page]).per(5).order(created_at: "#{sort_direction}")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_url, notice: "記事「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_url, notice: "記事「#{@article.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.now
      @article.update_column(:deleted_at, now)
    end

    @article.destroy
    redirect_to articles_url, notice: "記事「#{@article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :Author)
  end

  def set_article
    @article = Article.find(params["id"])
  end

  def sort_direction
    params[:direction] ? params[:direction] : 'desc'
  end
end
