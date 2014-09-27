class UsersController < ApplicationController

  def index
  end

  def show
    current_user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User was successfully created."
      redirect_to root_path
    else
      flash.notice = "Try again."
      render :new
    end
  end

  def update
    if current_user.update(user_params)
      flash.notice = 'User was successfully updated.'
      redirect_to user_path(@user)
    else
      flash.notice = "Try again."
      render :edit
    end
  end

  # def destroy
  #   @user.destroy
  #   flash.notice = 'User was successfully destroyed.'
  #   redirect_to root_path
  # end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
