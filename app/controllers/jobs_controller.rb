class JobsController < ApplicationController
  def index
    @posts = Post.awaiting_correction.not_mine(current_user.id)
  end
end
