class TaskController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@tasks = Task.all
	end

	def new
		@user = User.find(session[:user_id])
		@task = Task.new
	end

	def create
		@user = User.find(session[:user_id])
		@task = @user.tasks.new(task_params)
		if @task.save
			respond_to do |format|
				format.html {redirect_to user_path(@user)}
				format.json {render :json => @task}
			end
		else
			flash[:notice] = "Creation unsuccessful, please try again"
			redirect_to new_user_task
		end
	end

	def show
		#@user = User.find(session[:user_id])
		@task = Task.find(params[:id])
	end

	def edit
		@user = User.find(session[:user_id])
		@task = Task.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@task = Task.find(params[:id])

		if @task.update(update_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@task = Task.find(params[:id])

		@task.destroy
			
	
		redirect_to user_path
	end




	private

	def task_params
		params.require(:task).permit(:user_id, :title, :content, :due_date)
	end

	def update_params
		params.require(:user_task).permit(:user_id, :title, :content, :due_date)
	end


end
