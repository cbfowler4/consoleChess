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

FactoryBot.define do
  factory :goal do
    title {Faker::TheFreshPrinceOfBelAir.character}
    body {Faker::TheFreshPrinceOfBelAir.quote}
    private_goal false
    completed false
  end
end
