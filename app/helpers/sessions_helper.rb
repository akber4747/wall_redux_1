module SessionsHelper
	def sign_in(user)
		session[:user_id] = user.id
		# set the value of the current user
		self.current_user = (user)	
	end


	# setter method, set the value of the current user as an instance variable
	def current_user=(user)
		@current_user = user
	end

	# getter method, returns info of current user
	def current_user 
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	# if there's a current user (someone is logged on), this function will return TRUE
	def signed_in?
		!current_usernil?
	end

	def sign_out
		session[:user_id] = nil
		# this resets the current user to nil using the current_user= setter method!
		self.current_user = nil
	end
	# this one returns TRUE if the user passed to the function is equal the current user signed in
	def current_user?(user)
		user == self.current_user
		
	end

	def deny_access
		redirect_to signin_path, :notice => "Please sign in to access this page"
	end

end
