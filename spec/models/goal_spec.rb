# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :string
#  user_id      :integer
#  completed    :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  private_goal :boolean
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) do 
    dummy_create_goal
  end 
  
  describe "validations" do 
    it { should validate_presence_of(:body)}
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:private_goal)}
    it { should validate_presence_of(:completed)}
    it { should validate_presence_of(:user)}
  end   
  
  describe "associations" do 
    it { should belong_to(:user)}
  end 
  
  describe "#make_private" do 
    it "should make a public goal private" do 
      goal.make_private 
      expect(goal.private_goal).to be(true)
    end 
  end 
  
  describe "#make_public" do 
    it "should make a private goal public" do 
      goal.make_public
      expect(goal.private_goal).to be(false)
    end 
  end 
  
  describe "#make_complete" do 
    it "should make an incomplete goal complete" do 
      goal.make_complete
      expect(goal.completed).to be(true)
    end   
  end 
  
  describe "#make_incomplete" do 
    it "should make a complete goal incomplete" do 
      goal.make_incomplete 
      expect(goal.completed).to be(false)
    end
  end 
  
end
