class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.three_most_recent_posts
    @current_user = current_user
    @posts = @user.posts
  end
end
