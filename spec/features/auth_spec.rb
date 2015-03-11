require 'rails_helper'
require_relative 'features_helper.rb'


feature "signing up" do

  scenario "logs in after sign up" do
    visit new_sessions_url

    within(".sign-up") do
      fill_in 'user[username]', with: "User"
      fill_in 'user[email]', with: "user@test.com"
      fill_in 'user[password]', with: "password"
    end

    click_on 'Sign Up'
    expect(page).to have_content "Welcome, User"

  end

  feature "handles invalid input" do

    scenario "displays errors if invalid information provided" do
      visit new_sessions_url

      click_on 'Sign Up'

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Username can't be blank"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"

    end

  end

end

feature "redirects depending on session status" do

  scenario "redirects to sign in/up on visiting any page if logged out" do
    visit root_url
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Sign Up"

  end

  scenario "redirects if attempting to visit sign in/up page while signed in" do
    make_user1
    sign_in("user1", "password1")
    visit new_sessions_url
    expect(page).not_to have_content "Sign In"
    expect(page).not_to have_content "Sign Up"
  end

end

feature "signing in" do

  before(:each) do
    make_user1
  end

  scenario "user can log in with username" do
    visit new_sessions_url

    within(".sign-in") do
      fill_in 'user[login]', with: "user1"
      fill_in 'user[password]', with: "password1"
    end
  end

  scenario "user can log in with email" do
    visit new_sessions_url

    within(".sign-in") do
      fill_in 'user[login]', with: "user1@test.com"
      fill_in 'user[password]', with: "password1"
    end
  end


  scenario "redirects after sign in" do
    sign_in("user1", "password1")

    expect(page).to have_content "Welcome, user1"
    expect(page).not_to have_content "Sign In"
    expect(page).not_to have_content "Sign Up"
  end

  scenario "displays error if invalid information provided" do
    visit new_sessions_url
    click_on 'Sign In'

    expect(page).to have_content "Invalid Login"
  end


end
