class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.employee_id = current_user.id
    @comment.article_id = @article.id
    if @comment.save
      redirect_to article_path(@article)
      flash[:notice] = "コメントを投稿しました"
    else
      redirect_to article_path(@article)
      flash[:notice] = "コメントの投稿に失敗しました"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
    else
      flash[:notice] = "コメントの削除に失敗しました"
    end
    redirect_to @article
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
