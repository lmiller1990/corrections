class JobsController < ApplicationController
  def index
    @posts = Post.awaiting_correction
  end
end
