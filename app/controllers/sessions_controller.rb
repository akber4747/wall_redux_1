class SessionsController < ApplicationController
  def new
  	redirect_to new_user_path
  end

# creates the session (lets user log on)
  def create
  	session[:email] = params[:session][:email]
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		flash[:error] = "we could not find a user viz those cchredenshls"
  		redirect_to new_session_path
  	else
  		sign_in user #helper function!
  		redirect_to users_path
  	end
  end

  def destroy
  	sign_out #helper function
  	redirect_to signin_path
  end
end
