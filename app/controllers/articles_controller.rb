class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all  
  end

  def new
    @article = Article.new
  end

  def show
    set_article
    set_comments
  end

  def create
    @article = Article.new(required_params.except(:tags))
    @article.user_id = current_user.id
    create_or_delete_article_tags(@article, params[:article][:tags])

    uploaded_file = params[:article][:file_path]
    if uploaded_file
      @article.file_path = "/uploads/" + uploaded_file.original_filename

      File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
      end
    end

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def update
    set_article
    uploaded_file = params[:article][:file_path]
    create_or_delete_article_tags(@article, params[:article][:tags])

    if uploaded_file
      full_old_file_path = Rails.root.join('public', 'uploads', @article.file_path.gsub('/uploads/',''))
      full_new_file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
      File.delete(full_old_file_path)

      File.open(full_new_file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      @article.file_path = "/uploads/" + uploaded_file.original_filename
    end
    

    @article.title = params[:article][:title]
    @article.text = params[:article][:text]
    @article.save
    redirect_to @article
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

  def create_or_delete_article_tags(article, tags)
    article.taggables.destroy_all
    tags = tags.strip.split(',')
    tags.each do |tag|
      article.tags << Tag.find_or_create_by(name: tag)
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_comments
    @comments = Comment.where("article_id = ?", params[:id])
  end

  def required_params
    params.require(:article).permit(:title, :text, :file_path, :tags)
  end

end
