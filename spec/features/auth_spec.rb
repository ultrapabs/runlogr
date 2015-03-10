require 'spec_helper'

feature "redirects depending on session status" do

  scenario "redirects to sign in/up on visiting any page" do
    
  end

  scenario "redirects if attempting to visit sign in/up page while signed in" do

  end

end


feature "signing up" do

  scenario "can sign up" do

  end

  scenario "logs in after signup" do

  end

  feature "handles invalid input" do

    scenario "displays errors if invalid information provided" do

    end

    scenario "stores username/email in inputs on failed attempt" do

    end

  end

end

feature "signing in" do

  scenario "signs user in" do

  end

  feature "user can sign in with username or email" do

    scenario "user can log in with username" do
    end

    scenario "user can log in with email" do
    end

  end

  scenario "redirects after sign in" do
    #check for log out button
  end


  feature "handles invalid input" do

    scenario "displays errors if invalid information provided" do

    end

    scenario "stores username or email in input on failed attempt" do

    end

  end
end
