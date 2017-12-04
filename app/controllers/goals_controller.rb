class GoalsController < ApplicationController
  def new
  end

  def create
    goal = Goal.new(goal_params)
    
    if goal.save 
      redirect_to goal_url(goal.id) 
    else 
      flash[:errors] = goal.errors.full_messages 
      render :new
    end 
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy 
    redirect_to goals_url 
  end

  def index
    @users = User.all.includes(:goals)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def update
    goal = Goal.find(params[:id])
    
    if goal.update(goal_params)
      redirect_to goal_url(goal.id)
    else 
      flash[:errors] = goal.errors.full_messages 
      render :edit
    end  
  end

  def edit
    @goal = Goal.find(params[:id])
  end
  
  def goal_params
    params.require(:goal).permit(:body, :title, :private_goal, :completed)
  end
end
