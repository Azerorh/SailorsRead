class Comment < ApplicationRecord
  belongs_to :article

  validates :author, presence: true
  validates :body, presence: true, length: {maximum: 4000}
end
