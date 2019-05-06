class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create_with_cost(post_params)
    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(
      :original_text, 
      :corrected_text
    )
  end
end
