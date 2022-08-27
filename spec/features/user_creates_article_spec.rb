require 'rails_helper'

feature "Article creation" do
  before(:each) do
    sign_up
  end

  scenario "allows user to see articles list" do
    visit articles_path
    expect(page).to have_content 'Articles list'
  end

  scenario "admin creates an article" do
    login_as_admin

    visit new_article_path

    expect(page).to have_content 'New article'

    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'Article text'
    attach_file('article_file_path', "#{Rails.root}/public/uploads/pdf.pdf")

    click_button('Add article')

    expect(page).to have_content 'Article title'
    expect(page).to have_content 'Article text'
  end

  scenario "admin creates an article without file" do
    login_as_admin

    visit new_article_path
    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'Article text'
    click_button('Add article')

    expect(page).to have_content 'New article'
  end

  scenario "admin edit an article" do
    user = create_admin
    login_as(user)
    article = create(:article, user_id: user.id)

    visit edit_article_path(article)

    expect(page).to have_content 'Edit article'

    fill_in :article_title, with: 'Article title edited'
    fill_in :article_text, with: 'Article text edited'
    attach_file('article_file_path', "#{Rails.root}/public/uploads/pdf.pdf")

    click_button('Add article')

    expect(page).to have_content 'Article title edited'
    expect(page).to have_content 'Article text edited'
  end

  scenario "admin delete an article" do
    user = create_admin
    login_as(user)
    article = create(:article_with_comments, user_id: user.id)

    visit articles_path

    expect { click_link('Delete') }.to change(Article, :count).by(-1)
    expect(page).to have_content 'Articles list'
  end
end