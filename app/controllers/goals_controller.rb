class GoalsController < ApplicationController
  def index
    # @goals = Goal.where(visibility: 'public').or(user_id: current_user.id)
    @goals = Goal.where('visibility = ? OR user_id = ?', 'public', current_user.id)
    render :index
  end

  def new

  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])

     if @goal.update(goal_params)
       redirect_to goal_url(@goal)
     else
       flash.now[:errors] = @goal.errors.full_messages
       render :edit
     end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:content, :visibility, :status)
  end
end
