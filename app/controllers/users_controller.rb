class UsersController < ApplicationController
  before_action :require_user, except: %i[new create]
  #before_action :find_current_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.username = @user.username.downcase

    if @user.save
      flash[:notice] = "Welcome #{@user.username}!"
      session[:username] = @user.username
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong'
      render new_users_path
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @opinion = Opinion.new
    @not_following = current_user.friends_not_following
    @opinions = @user.opinions.ordered_by_most_recent
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    flash.notice = 'Your profile has been updated!'

    redirect_to profile_path(@user.username)
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end

  # def find_current_user
  #   @user = current_user
  # end
end
