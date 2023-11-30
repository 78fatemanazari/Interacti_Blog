class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
    @comments = fetch_comments(@posts)
  end

  def show
    # No need to find @post again, as it's already set in the before_action
    @author = User.find(@post.author_id)
    @comments = @post.comments.limit(5)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def fetch_comments(posts)
    comments = []

    posts.each do |post|
      comments << post.comments.limit(5)
    end

    comments
  end
end
