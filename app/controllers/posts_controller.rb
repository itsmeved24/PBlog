class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  
  def index
    if user_signed_in?
      @posts = Post.with_attached_photo.includes(:user).order(created_at: :desc)
    else
      @posts = []
    end
  end
  
  def show
    # The view will be rendered automatically
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def edit
    # The view will be rendered automatically
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: 'Not authorized' unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
