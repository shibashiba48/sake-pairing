class Posts::SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @posts = Post.search(@keyword)
  end
end
