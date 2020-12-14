class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    @user = User.find_by(username: params[:session][:username].strip.downcase)

    if @user
      session[:username] = @user.username
      flash[:success] = 'Welcome back.'
      redirect_to root_path
    else
      flash.now[:alert] = 'The username doesn’t match any account.'
      redirect_to login_path
    end
  end
  
  def destroy
    session[:username] = nil
    flash[:success] = "You’re logged out."
    redirect_to login_path
  end
  
  
end
