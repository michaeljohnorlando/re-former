class UserController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    puts "\n running create def in user_controller \n"
    @user = User.new(user_params)
    #@user = User.new(username: params[:user_name], email: params[:email], password: params[:password])
      if @user.save
        redirect_to new_user_path
      else
        render :new
      end
  end

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
