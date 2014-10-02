require 'Date'
class Task < ActiveRecord::Base
	belongs_to :user



	def self.find_due_date
		date = DateTime.now.to_date
		tasks = Task.all

		tasks.each do |task|
			
			user = task.user_id
			a    = User.find(user)
			a.phone

			if date == task.due_date.to_date
				#call method that instantiates twilio client
			end
		end
	end

	def self.send_text
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
	end

end
