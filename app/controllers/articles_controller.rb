class ArticlesController < ApplicationController

  def index
    @articles = Article.active.order
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_url
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

  end


end
