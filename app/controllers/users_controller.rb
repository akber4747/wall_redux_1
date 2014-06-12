class UsersController < ApplicationController
  def index
    @current_user = User.find_by(:email => session[:email])

  end
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to '/sessions/new'
  	else
  		flash[:error] = @user.errors.full_messages
  		render 'new'
  	end


  end

  def show
    @current_user = User.find_by(:email => session[:email])
      @all_posts = Post.all

  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
  end
  def post_params
    params.require(:post).permit(:author, :content)
  end

end
