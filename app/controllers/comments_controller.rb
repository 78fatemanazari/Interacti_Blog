class CommentsController < ApplicationController
  before_action :attr_user_post

  def new
    @comment = Comment.new(user: current_user, post: @post)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save!
      flash[:success] = ' Comment added succefully '
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attr_user_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
