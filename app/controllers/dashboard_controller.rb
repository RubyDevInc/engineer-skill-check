class DashboardController < ApplicationController
  before_action :set_employee, only: %i(edit update destroy)

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

  def set_employee
    @employee = Employee.find(params["id"])
  end

end
