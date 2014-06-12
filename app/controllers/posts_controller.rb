class PostsController < ApplicationController
  def index
        @current_user = User.find_by(:email => session[:email])
  @current_user = User.find_by(:email => session[:email])
      @all_posts = Post.all
    render '/users/index'
  end

  def show
  end

  def new
  end

  def create
  @current_user = User.find_by(:email => session[:email])
      @all_posts = Post.all
  @post = Post.new(post_params)
  if @post.save
    render 'users/index'
  else
    flash[:error] = @post.errors.full_messages
  end

  end

  def edit
  end

  def update
  end


  def destroy
  end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
  end

  def post_params
    params.require(:post).permit(:author, :content, :user_id)
  end
end
