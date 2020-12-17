class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].strip.downcase)
    if @user
      session[:username] = @user.username
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Email incorrect'
      render :new
    end
  end

  def destroy
    session[:username] = nil
    flash[:success] = "You’re logged out."
    redirect_to login_path
  end
end
