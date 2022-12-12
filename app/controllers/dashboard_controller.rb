class DashboardController < ApplicationController

  def index
    @articles=Article.all.order(created_at:"desc")
    if @articles.first.created_at > @articles.last.created_at
      @sort="asc"
    else
      @sort="desc"
    end
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(title:params[:title],content:params[:content],author:session[:user_id])
    if @article.save
      flash[:notice]="記事を投稿しました"
      redirect_to("/dashboard/index")
    else
      render("dashboard/new")
    end
  end


  def show
    @article=Article.find_by(id:params[:id])
  end

  def sort
    @articles=Article.all.order(created_at: params[:sort])
    if params[:sort]=="desc"
      @sort="asc"
    else
      @sort="desc"
    end

    render("dashboard/index")
  end


end
