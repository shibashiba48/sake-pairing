class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.iine(current_user)
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    @post.uniine(current_user)
  end
end
