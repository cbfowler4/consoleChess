require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end 

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do 
      dummy_signup
      expect(page).to have_content("bob")
    end 
    
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do 
    dummy_login
    expect(page).to have_content("bob")
  end 

end

feature 'logging out' do
  scenario 'begins with a logged out state' do 
    visit new_session_url
    expect(page).not_to have_content("bob")
  end 

  scenario 'doesn\'t show username on the homepage after logout' do 
    dummy_login
    click_button("Sign Out")
    expect(page).not_to have_content("bob")
  end 


end