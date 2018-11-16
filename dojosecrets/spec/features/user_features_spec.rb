require 'rails_helper'
feature 'User features ' do
  feature "user sign-up" do
    	before(:each) do
    		visit "/users/new"
    	end
    scenario 'visits sign-up page' do
    	expect(current_path).to eq('/users/new')
    	expect(page).to have_field('user[name]')
    	expect(page).to have_field('user[email]')
    	expect(page).to have_field('user[password]')
    	expect(page).to have_field('user[password_confirmation]')
    	expect(page).to have_button('register')
    end
    scenario "with improper inputs, redirects back to sign in and shows validations" do
    	fill_in "user[name]", with: ""
    	fill_in "user[email]", with: "helloworld.com"
    	fill_in "user[password]", with: "helloworld"
    	fill_in "user[password_confirmation]", with: "hellosworld"
    	click_button "register"
    	expect(current_path).to eq("/users/new")
    	expect(page).to have_content("Email is invalid", "Password confirmation doesn't match Password")
    	expect(page).to have_content("Name can't be blank")
    end
    scenario "with proper inputs, create user and redirects to login page" do
    	fill_in "user[name]", with: "hello world"
    	fill_in "user[email]", with: "hell@oworld.com"
    	fill_in "user[password]", with: "helloworld"
    	fill_in "user[password_confirmation]", with: "helloworld"
    	click_button "register"
    	expect(current_path).to eq("/sessions/new")
    end
  end
  # feature "user dashboard" do 
  #   scenario "displays user information" 
  # end
end
# google udacity nano degreee 