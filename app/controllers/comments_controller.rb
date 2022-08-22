class CommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.new(required_params)
    comment.author = current_user.username
    comment.save

    redirect_to article_path(article)
  end

  private

  def required_params
    params.require(:comment).permit(:author, :body)
  end

end
