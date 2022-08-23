require "rails_helper"

describe Article do
  describe "associations" do
    it { should have_many :comments }
    it { should belong_to :user }
  end

  describe '#subject' do
    it "returns the article title" do
      # create article
      user = create(:user)
      article = create(:article, title: 'Lorem Ipsum', 
                                 user_id: user.id)

      # assert
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  describe "#last_comment" do
    it "returns last comment" do
      user = create(:user)
      article = create(:article_with_comments, user_id: user.id)

      expect(article.last_comment).to eq "Comment body 6"
    end
  end

  describe "validations" do
    it { should validate_length_of(:text).is_at_most(4000) }
    it { should validate_length_of(:title).is_at_most(150) }
    it { should validate_presence_of(:file_path) }
  end
end