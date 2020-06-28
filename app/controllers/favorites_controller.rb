class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.like(current_user)
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    @post.dislike(current_user)
  end
end
