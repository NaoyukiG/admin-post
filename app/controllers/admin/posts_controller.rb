class Admin::PostsController < ApplicationController
  before_action :if_not_admin

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def post_params
    params.rewuire(:post).permit(:text).merge(user_id: current_user.id)
  end
end
