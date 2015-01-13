require 'spec_helper'
require 'rails_helper'

feature 'creating a goal' do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'
  end

  scenario 'has a new goal page' do
    visit new_goal_url
    expect(page).to have_content 'New Goal'
  end

  scenario 'allows you to submit a goal' do
    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'private'
    choose 'no'
    click_button 'Add Goal'
    expect(page).to have_content 'my goal is to run'
  end
end

feature 'Viewing goals' do

  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'private'
    choose 'no'
    click_button 'Add Goal'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to bike'
    choose 'public'
    choose 'no'
    click_button 'Add Goal'
    click_button 'Sign Out'

    visit new_user_url
    fill_in 'username', :with => 'User2'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to swim'
    choose 'private'
    choose 'no'
    click_button 'Add Goal'
  end

  scenario 'a user can view all public goals and their private goals' do
    visit goals_url
    expect(page).to have_content 'my goal is to bike'
    expect(page).to have_content 'my goal is to swim'
  end

  scenario 'a user can not view another users private goals' do
    visit goals_url
    expect(page).to have_no_content 'my goal is to run'
  end
end

feature 'updating goals' do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'private'
    choose 'no'
    click_button 'Add Goal'
  end

  scenario 'allows you to update a goal' do
    visit edit_goal_url(1)
    fill_in 'content', with: 'my goal is to skateboard'
    choose 'private'
    click_button 'Add Goal'
    expect(page).to have_content 'my goal is to skateboard'
  end

  scenario 'has values already filled in' do
    visit edit_goal_url(1)
    find_field("private").should be_checked
    click_button 'Add Goal'
    expect(page).to have_content 'my goal is to run'
  end
end

feature "Deleting goals" do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'private'
    choose 'no'
    click_button 'Add Goal'
  end

  scenario "allows you to delete a goal" do
    click_button 'Remove Goal'
    expect(page).to have_no_content "my goal is to run"
  end
end

feature "Tracking completed goals" do
  background do
    visit new_user_url
    fill_in 'username', :with => 'User'
    fill_in 'password', :with => 'password'
    click_button 'Create User'

    visit new_goal_url
    fill_in 'content', with: 'my goal is to run'
    choose 'private'
    choose 'yes'
    click_button 'Add Goal'
  end

  scenario 'shows whether goals are complete or not' do
    expect(page).to have_content "Completed"
  end
end
