class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:images).order("created_at DESC")
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    @post = Post.new(post_params)
    # binding.pry
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :tag, :text, images_attributes: [:src], tags_attributes: [:text])
  end


end
