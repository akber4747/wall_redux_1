class User < ActiveRecord::Base
	# the following allows my form to contain a field called password that we can use on the model side, even though there's no field in the db called 'password' (it's called 'encrytped password')
	has_many :posts
	attr_accessor :password, :password_confirmation

  	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  	validates :first_name,:last_name, :presence 			=> true,
  			  :length          			=> {:maximum => 50}
	validates :email, :presence 		=> true,
			  :format 					=> {:with => email_regex},
			  :uniqueness 				=> {:case_sensetive => false}
	validates :password, :presence  	=> true,
			  :confirmation    				=> true,
			  :length					=> {:within => 2..20}

    before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)

		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
	def encrypt_password
		# generates a unique salt value if its a new user
		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}==#{password}") if self.new_record?

		self.encrypted_password = encrypt(password)
	end
	def encrypt(pass)
		Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
	end




end
