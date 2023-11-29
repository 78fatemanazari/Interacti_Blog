class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
    @comments = []

    @posts.each do |post|
      comments = post.comments.limit(5)
      @comments << comments
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
