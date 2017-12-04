# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    
    it { should validate_length_of(:password).is_at_least(6)}
    
    # it { should have_many()}
    
  end
  
  describe "::find_by_credentials" do 
    subject(:user) do
      FactoryBot.create(:user)
    end 
    
    it "should return user if username and password match" do 
      new_user = User.find_by_credentials(user.username, "password")
      expect(new_user).to eq(user)
    end 
    
    it "should return nil if no matching username found" do 
      new_user = User.find_by_credentials(user.username + 'a', "password")
      expect(new_user).to be(nil)
    end 
    it "should return nil if password does not match username" do 
      new_user = User.find_by_credentials(user.username, "123456")
      expect(new_user).to be(nil)
    end 
  end 
  
end
