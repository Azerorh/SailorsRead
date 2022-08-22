module ArticlesHelper

  def comments_counter article
    article.comments.size
  end

  def author article
    if article.user_id
      author = User.find(article.user_id)
      
      if author.username
        author.username
      else
        author.email
      end
    else
      'Unknown'
    end
  end

end
