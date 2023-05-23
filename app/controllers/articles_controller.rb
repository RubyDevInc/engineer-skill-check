# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.active.order("#{sort_column} #{sort_direction}")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.employee = current_user
    if @article.save
      redirect_to article_path(@article), notice: "お知らせ「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
    @article.employee = current_user
  end

  def update
    @article = Article.find(params[:id])
    @article.employee = current_user
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "お知らせ「#{@article.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_url, notice: "お知らせ「#{@article.title}」を削除しました。"
    else
      render :index
    end
  end

  private

  def article_params
    params.require(:article).permit(:employee_id, :title, :content, :author)
  end

  def sort_column
    params[:sort] || 'created_at'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end
