class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all  
  end

  def new
      
  end

  def show
    set_article
    set_comments
  end

  def create
    @article = Article.new(required_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def update
    set_article
    if @article.update(required_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def edit
    set_article
  end

  def destroy
    set_article
    comments = @article.comments
    comments.each do |comment|
      comment.destroy
    end
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  def search
    if params[:search].blank?
      redirect_to articles_path
    else
      @parameter = params[:search].downcase
      @results = Article.where('title ILIKE ?', "%" + @parameter + "%")
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_comments
    @comments = Comment.where("article_id = ?", params[:id])
  end

  def required_params
    params.require(:article).permit(:title, :text)
  end

end
