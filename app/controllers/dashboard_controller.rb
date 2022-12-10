class DashboardController < ApplicationController

  def index
    @articles=Article.all
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


end
