class Article < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :title, length: { maximum: 150 }
  validates :text, length: { maximum: 4000 }
  validates :file_path, presence: true

  def subject
    title
  end

  def last_comment
    comments.last.body
  end
end
