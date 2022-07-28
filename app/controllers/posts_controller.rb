class PostsController < ApplicationController
  def index
    @posts = Post.all(:user).order("created_at DESC")
  end
end
