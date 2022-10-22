# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit show update destroy]
  before_action :set_form_option, only: %i[new create]

  def index
    @articles = Article.active.order(created_at: 'DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_url, notice: "「#{@article.title}」を作成しました。"
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to articles_url, notice: "「#{@article.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.zone.now
      @article.update(deleted_at: now)
    end

    redirect_to articles_url, notice: "「#{@article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :employee)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_form_option
    @employee = Employee.find(current_user.id)
  end
end
