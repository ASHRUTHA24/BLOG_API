class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    like = post.likes.new(user: current_user)

    if like.save
      render json: { message: "Post liked!" }, status: :created
    else
      render json: { error: like.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user: current_user)
    
    if like
      like.destroy
      render json: { message: "Like removed" }
    else
      render json: { error: "Like not found" }, status: :not_found
    end
  end
end
