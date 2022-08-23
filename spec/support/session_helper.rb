def sign_up
  visit new_user_registration_path

  fill_in :user_email, with: 'user@example.com'
  fill_in :user_username, with: 'username'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'

  click_button 'Sign up'
end

def create_admin
  user = create(:user, username: 'admin',
                       email: 'admin@gmail.com',
                       password: '12345678',
                       is_admin: true)
end

def login_as_admin
  user = create_admin
  login_as(user)
end