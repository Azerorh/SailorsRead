require 'rails_helper'

describe 'Articles helpers' do
  it "returns comments size" do
    user = create(:user)
    article = create(:article_with_comments, user_id: user.id)

    expect(helper.comments_counter article).to eq 3
  end

  it "returns author username if exist" do
    user = create(:user)
    article = create(:article, user_id: user.id)

    expect(helper.author article).to eq user.username
  end

  it "returns author email if username not exist" do
    user = create(:user, username: nil)
    article = create(:article, user_id: user.id)

    expect(helper.author article).to eq user.email
  end
end