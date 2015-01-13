require 'rails_helper'
require 'spec_helper'

feature 'Add comments to users' do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit user_url(1)
    fill_in 'content', with: 'Cool goal dude'
    click_button 'Submit Comment'
  end

  scenario 'creates comment on users show page' do
    expect(page).to have_content 'Cool goal dude'
  end
end

feature 'Add comments to goals' do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'public'
    choose 'no'
    click_button 'Add Goal'

    visit goal_url(1)
    fill_in 'content', with: 'Cool goal dude'
    click_button 'Submit Comment'
  end

  scenario 'creates comment on goal show page' do
    expect(page).to have_content 'Cool goal dude'
  end
end
