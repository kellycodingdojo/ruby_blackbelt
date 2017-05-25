class JoinsController < ApplicationController

  def create
    @joiners = Join.create(user: current_user, group_id: params[:id])
    
      redirect_to :back
    end
  

  def destroy
    @group = Group.find(params[:id])
    @join = Join.find_by(group: @group, user: current_user)
    @join.destroy if current_user === @join.user
    redirect_to :back
  end

end
