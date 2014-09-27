class SessionsController < ApplicationController
  
  def create
  	reset_session
  	@user = User.find_by_email(user_params[:email])
		if @user && @user.authenticate(user_params[:password])
			new_session
			redirect_to user_path(@user)
		else
			flash.notice = 'Incorrect username or password.'
  		redirect_to root_path
		end
  end

  def destroy
    end_session
    flash.notice = "Successfully logged out."
    redirect_to root_path
  end


private 

	def user_params
    params.require(:user).permit(:email, :password)
  end
	
	def new_session
    session[:user_id] = @user.id
  end

  def end_session
    session.clear
  end  

end