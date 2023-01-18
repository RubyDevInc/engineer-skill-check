class ArticlesController < ApplicationController
  before_action :set_article, only: %i(edit update destroy show)

  def index
    @articles = Article.active.order("created_at #{sort_direction}")
  end

  def show
    @articles = Article.active
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_url, notice: "「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_url
    else
      render :edit
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.zone.now
      @article.update_column(:deleted_at, now) if @article.present?
    end

    redirect_to articles_url, notice: "「#{@article.title}」を削除しました。"

  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params["id"])
  end

  def sort_direction
    params[:direction] ? params[:direction] : 'asc'
  end

end
