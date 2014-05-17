require 'spec_helper'

feature 'user can register' do
  scenario 'user goes to registration page and registers' do
    visit register_path
    fill_in 'user[username]', with: 'foo'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Register'
    expect(page).to have_content 'Thanks for registering'
  end

  scenario 'user goes to registration page and doesnt have matching passwords' do
    visit register_path
    fill_in 'user[username]', with: 'foo'
    fill_in 'user[password]', with: 'pass'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Register'
    expect(page).to have_content 'Something went wrong'
  end

  scenario 'user goes to login page and can login and then logout' do
    User.create!(
      username: 'foo',
      password: 'password',
      password_confirmation: 'password'
    )
    visit login_path
    fill_in 'session[username]', with: 'foo'
    fill_in 'session[password]', with: 'password'
    click_on 'Login'

    expect(page).to have_content 'Thanks for logging in!'
    expect(page).to have_content 'foo'

    click_on 'Log Out'
    expect(page).to have_no_content 'Thanks for loggin in!'
    expect(page).to have_no_content 'foo'
  end

end