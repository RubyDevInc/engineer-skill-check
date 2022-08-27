class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)

  def index
    @articles = Article.active.order("#{sort_article} #{sort_direction}")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.employee = current_user
    if @article.save
      redirect_to articles_url, notice: "お知らせ「#{@article.title}」を登録しました。"
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
      redirect_to articles_url, notice: "お知らせ「#{@article.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "お知らせ「#{@article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :employee_id)
  end

  def set_article
    @article = Article.find(params["id"])
  end

  def sort_article
    params[:sort] ? params[:sort] : 'created_at'
  end

  def sort_direction
    params[:direction] ? params[:direction] : 'desc'
  end
end
