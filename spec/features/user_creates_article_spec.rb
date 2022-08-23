require 'rails_helper'

feature "Article creation" do
  before(:each) do
    sign_up
  end

  scenario "allows user to create article" do
    login_as_admin

    visit new_article_path
    expect(page).to have_content 'New article'
  end

  scenario "admin created an article" do
    login_as_admin

    visit new_article_path

    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'Article text'
    attach_file('article_file_path', "#{Rails.root}/public/uploads/pdf.pdf")

    click_button('Add article')

    expect(page).to have_content 'Article title'
    expect(page).to have_content 'Article text'
  end
end