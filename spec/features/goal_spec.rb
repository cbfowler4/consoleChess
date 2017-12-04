require 'spec_helper'
require 'rails_helper'

feature 'create goal' do
  before(:each) do 
    dummy_login
    visit new_goal_url
  end 
  
  
  scenario "has a create goal page" do 
    expect(page).to have_content("Create Goal")
  end 
  
  scenario "create a goal" do 
    fill_in(:title, with: "fitness goal")
    fill_in(:body, with: "do 10000 pushups in 1 hour")
    choose('private_false')
    choose('completed_false')
    click_button("Create Goal")
    expect(page).to have_content("fitness goal")
  end 
end

feature "show all goals" do 
  scenario "shows all goals on page" do 
    dummy_login
    3.times { dummy_create_goal }
    visit goals_url
    expect(page).to have_content(Goal.all.first.title)
    expect(page).to have_content(Goal.all.second.title)
    expect(page).to have_content(Goal.all.last.title)
  end  
end

feature "show goal details" do 
  scenario "show goal details on page" do 
    dummy_login
    goal = dummy_create_goal
    visit goal_url(goal)
    save_and_open_page
    expect(page).to have_content(goal.body)
  end 
end 



