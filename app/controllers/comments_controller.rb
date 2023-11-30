class CommentsController < ApplicationController
  before_action :set_user

  def index
    @comments = @user.comments.includes(:post).limit(5)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
