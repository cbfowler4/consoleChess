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

class Goal < ApplicationRecord
  validates :title, :body, :user, :presence => true
  validates :private_goal, :completed, inclusion: { in: [true, false]}
  belongs_to :user 
  
  def make_public
    self.private_goal = false
  end 
  
  def make_private
    self.private_goal = true
  end 
  
  def make_complete
    self.completed = true
  end 
  
  def make_incomplete
    self.completed = false
  end 
  
end
