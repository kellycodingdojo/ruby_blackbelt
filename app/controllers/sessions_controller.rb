class SessionsController < ApplicationController
  def create #Log User in with authenticate -- generates flash messages errors
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/groups"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/"
    end
  end


def destroy #Logs User out -- sets session[:user_id] to null -- redirects to login page
    reset_session
    redirect_to "/"
  end
end
