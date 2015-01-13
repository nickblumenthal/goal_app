require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature "signing up a user" do
    username = Faker::Internet.user_name
    password = Faker::Internet.password

    before(:each) do
      visit new_user_url
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button 'Create User'
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content username
    end
  end

end

feature "logging in" do
  username = Faker::Internet.user_name
  password = Faker::Internet.password

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Create User'

    visit new_session_url
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'sign in'
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content username
  end
end

feature "logging out" do
  username = Faker::Internet.user_name
  password = Faker::Internet.password

  scenario "begins with logged out state" do
    visit new_session_url
    expect(page).to have_no_content username
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_user_url
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Create User'
    click_button 'Sign Out'
    expect(page).to have_no_content username
    save_and_open_page
  end
end
