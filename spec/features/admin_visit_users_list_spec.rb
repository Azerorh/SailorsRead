require 'rails_helper'

describe 'Users list visit' do
  scenario "allows admin to see users list" do
    login_as_admin

    visit users_path
    expect(page).to have_content 'Users list'
  end

  scenario "not allows simple user to see users list" do
    sign_up

    visit users_path
    expect(page).to have_content 'Access denied'
  end
end