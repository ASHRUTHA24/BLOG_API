class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorize_user, only: [:update, :destroy]

  # GET /posts
  def index
    posts = Post.all
    render json: posts
  end

  # GET /posts/:id
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: { error: 'Failed to create post' }, status: :unprocessable_entity
    end
  end

  # PATCH /posts/:id
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { error: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  #like
  def like
    post = Post.find(params[:post_id])
    like = current_user.likes.create(post: post)
    render json: { likes_count: post.likes.count }, status: :ok
  end
  

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    render json: { error: 'Post not found' }, status: :not_found if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorize_user
    render json: { error: 'Forbidden' }, status: :forbidden unless @post.user == current_user
  end
end
