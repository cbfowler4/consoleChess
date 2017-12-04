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

FactoryBot.define do
  factory :user do
    username { Faker::Seinfeld.character}
    password { "password"}
  end
  
  factory :invalid_user do 
    username { Faker::Seinfeld.character}
    password { "12345"}
  end 
  
end
