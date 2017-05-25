class GroupsController < ApplicationController
	 def create
    @user = current_user
    @group = Group.new group_params
    if @group.save
    @join = Join.create(group_id: @group.id, user_id: current_user.id)
      redirect_to "/groups"
    else
      flash[:errors] = @group.errors.full_messages
       redirect_to :back
    end
  end

def show
	@user = User.find(current_user)
	@event = Group.find(params[:id])
	puts current_user.id
	puts @event.id
	puts '666666666666666666'
	@groups = Join.where(group_id: @event.id)
end

 def destroy
    @user = current_user
    @group = Group.find(params[:id])
    if @group.user.id == @user.id
      @group.destroy
      redirect_to "/groups"
    else
      flash[:errors] = @group.errors.full_messages
      redirect_to :back
    end
  end


private
    def group_params
      params.require(:group).permit(:title, :description).merge(user: current_user)
    end
 
    end
   
   