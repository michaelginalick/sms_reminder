require 'twilio-ruby'

class UserController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		if session[:user_id] != nil
			redirect_to user_path(User.find(session[:user_id]))
		else
			@user = User.new
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if  @user
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)	 
		else
			redirect_to root_url
   		end
	end


	def show
		@user = User.find(session[:user_id])
	end

	def destroy
		@user = User.find(session[:user_id])
		@user.destroy
		redirect_to root_path
	end


	 private

	def user_params
	    params.require(:user).permit(:name, :email, :phone, :password)
	end

end


		
   # sid = 'AC015b2287604a70f0e13bb96bc2179f59'
   # token = '4e93d70cf30464dd672d2aac869938ea'
   #  # Instantiate a Twilio client
   #           client = Twilio::REST::Client.new(sid, token)
   #           from = '+113144417029'
   #              # Create and send an SMS message
   #    		 client.account.messages.create(
   #      	 :from => from,
   #      	 :to => @user.phone,
   #      	 :body => "Thanks for signing up."
   #    )
   
