require "rails_helper"

feature "Articles search" do
  scenario "should show the result" do
    user = create_admin
    login_as(user)
    visit articles_path
    create(:article, title: 'Lorem Ipsum', user_id: user.id)

    fill_in :search, with: 'Lorem Ipsum'
    click_button('Search')

    expect(page).to have_content 'Lorem Ipsum'
  end

  scenario "should redirect to articles path when request is empty" do
    visit articles_path
    fill_in :search, with: ''
    click_button('Search')

    expect(page).to have_content 'Articles list'
  end
end