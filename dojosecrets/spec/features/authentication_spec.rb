require 'rails_helper'
feature 'authentication feature' do
  before do
    @user = create(:user)
  end
  feature "user attempts to sign-in" do
    before(:each) do
      visit "/sessions/new"
    end
    scenario 'visits sign-in page, prompted with email and password fields' do
     
      expect(page).to have_field("email")
      expect(page).to have_field("password")
    end
    scenario 'logs in user if email/password combination is valid'do
      fill_in "email", with: "cole@wittrock.com"
      fill_in "password", with: "password"
      click_button "login"

      expect(current_path).to eq("/users/show") 
    end
    scenario 'does not sign in user if email is not found' do
      fill_in "email", with: "hello@dsjkl.com"
      fill_in "password", with: "password"
      click_button "login"
      expect(page).to have_content("incorrect email")
      expect(current_path).to eq("/sessions/new")
    end
    scenario 'does not sign in user if email/password combination is invalid' do
      fill_in "email", with: "cole@wittrock.com"
      fill_in "password", with:"fjkalds"
      click_button "login"
      expect(page).to have_content("incorrect password")
      expect(current_path).to eq("/sessions/new")
    end
  end
  feature "user attempts to log out" do
    before(:each) do
      visit "/sessions/new"
      fill_in "email", with: "cole@wittrock.com"
      fill_in "password", with: "password"
      click_button "login"
    end
    scenario 'displays "Log Out" button when user is logged on' do
      expect(page).to have_link("logout")

    end
    scenario 'logs out user and redirects to login page' do
      click_link "logout"
      expect(current_path).to eq("/sessions/new")
    end
  end
end