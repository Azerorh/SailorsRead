require "rails_helper"

feature "Contact creation" do
  scenario "allows access to contacts page" do
    visit '/contacts'

    expect(page).to have_content I18n.t('contacts.contact_us')
  end

  scenario "allows to create contact" do
    visit '/contacts'

    fill_in :contact_email, with: 'user@example.com'
    fill_in :contact_message, with: 'message'

    click_button 'Save Contact'
    expect(page).to have_content 'Thanks!'
  end

  scenario "not allows to create contact with empty fields" do
    visit '/contacts'

    fill_in :contact_email, with: ''
    fill_in :contact_message, with: ''

    click_button 'Save Contact'
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Message can't be blank"
  end
end