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
      redirect_to article_path(@article), notice: "記事を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:employee_id, :title, :content, :author)
  end

end
