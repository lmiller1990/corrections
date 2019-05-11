class MyPostsController < ApplicationController
  def index
    @posts = current_user.posts
  end
end
