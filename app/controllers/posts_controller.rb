class PostsController < ApplicationController

  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = Post.all.includes(:images).order("created_at DESC")
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :tag, :text, images_attributes: [:id, :src, :_destroy], tags_attributes: [:text]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
