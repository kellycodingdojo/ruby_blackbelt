class UsersController < ApplicationController

def create
    # if params[:user][:password] == params[:user][:password_confirmation]  <== the pass and pass conf took care of this. 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/groups"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to :back
      end
  end

def show
	@user = User.find(current_user)
	@group = Group.all

end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
