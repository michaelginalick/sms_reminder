require 'twilio-ruby'
class UserController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		

		if @user.save	
			
			sid = 'AC015b2287604a70f0e13bb96bc2179f59'
			token = '4e93d70cf30464dd672d2aac869938ea'
			 # Instantiate a Twilio client
             client = Twilio::REST::Client.new(sid, token)
             from = '+113144417029'
                # Create and send an SMS message
      		 client.account.messages.create(
        	 :from => from,
        	 :to => @user.phone,
        	 :body => "Thanks for signing up."
      )
      		 puts "Sent message to #{@user.phone}"
      		 
		else
			 if @user.errors.any?
   			@user.errors.full_messages do |msg|
   			 msg 
   			end
   		end
			render :new

		end
	end


	 private

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end

end
